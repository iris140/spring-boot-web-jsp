package com.iris.hai8tech.repository.custom.impl;

import com.iris.hai8tech.builder.BuildingSearchBuilder;
import com.iris.hai8tech.entity.BuildingEntity;
import com.iris.hai8tech.model.response.BuildingSearchResponse;
import com.iris.hai8tech.repository.custom.BuildingRepositoryCustom;
import com.iris.hai8tech.security.utils.NumberUtil;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;
import org.springframework.util.NumberUtils;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.lang.reflect.Field;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

@Repository
public class BuildingRepositoryImpl implements BuildingRepositoryCustom {

    @PersistenceContext
    private EntityManager entityManager;


    @Override
    public List<BuildingEntity> findAll(BuildingSearchBuilder buildingSearchBuilder, Pageable pageable) {

        StringBuilder sql = new StringBuilder(
                " SELECT b.* FROM building b ");
        joinTable(buildingSearchBuilder, sql);
        StringBuilder where = new StringBuilder(" WHERE 1=1 ");

        // hàm bên dưới sẽ tiếp tục chèn sau câu where
        queryNormal(buildingSearchBuilder, where);
        querySpecial(buildingSearchBuilder, where);

        where.append(" GROUP BY b.id ");

        // phân trang
        splitPage(pageable, where);

        sql.append(where);

        Query query = entityManager.createNativeQuery(sql.toString(), BuildingEntity.class);
        // thao tác chèn
        return query.getResultList();
    }

    @Override
    public int countTotalItem(BuildingSearchBuilder buildingSearchBuilder) {

        StringBuilder sql = new StringBuilder(
                " SELECT COUNT(DISTINCT b.id) FROM building b "
        );

        joinTable(buildingSearchBuilder, sql);

        StringBuilder where = new StringBuilder(" WHERE 1=1 ");

        queryNormal(buildingSearchBuilder, where);
        querySpecial(buildingSearchBuilder, where);

        sql.append(where);

        Query query = entityManager.createNativeQuery(sql.toString());

        Number result = (Number) query.getSingleResult();

        return result.intValue();
    }

//    @Override
    public int countTotalItem(BuildingSearchResponse buildingSearchResponse) {
        String sql = buidQueryFilter(buildingSearchResponse.getId());
        Query query = entityManager.createNativeQuery(sql);
        return query.getResultList().size();
    }

    private String buidQueryFilter(Long id) {
        String sql = "SELECT b.* FROM building WHERE b.id= " + id;
        return sql;
    }

    public void splitPage(Pageable pageable, StringBuilder where) {
        where.append(" LIMIT ").append(pageable.getPageSize()).append("\n")
                .append(" OFFSET ").append(pageable.getOffset());
    }


    // join table
    public static void joinExecute(BuildingSearchBuilder buildingSearchBuilder, StringBuilder sql) {
        String staffId = buildingSearchBuilder.getStaffId().toString();
        if (NumberUtil.isNumber(staffId))
            sql.append(" join assignmentbuilding on assignmentbuilding.buildingid = b.id ");
    }

    public static void joinTable(BuildingSearchBuilder buildingSearchBuilder, StringBuilder sql) {

        Long staffId = buildingSearchBuilder.getStaffId();
//		String staffId = (String) params.get("user_Id");
        if (staffId != null) {
            sql.append(" INNER JOIN assignmentbuilding ON b.id = assignmentbuilding.buildingid ");
        }

        List<String> typeCode = buildingSearchBuilder.getTypeCode();
        if (typeCode != null && typeCode.size() != 0) {
            sql.append(" INNER JOIN buildingrenttype ON b.id = buildingrenttype.buildingid ");
            sql.append(" INNER JOIN renttype ON renttype.id = buildingrenttype.renttypeid ");
        }

        // thay đổi thành EXIST phía dưới
//		String rentAreaTo = (String) params.get("areaTo");
//		String rentAreaFrom = (String) params.get("areaFrom");
//
//		if (StringUtil.checkString(rentAreaTo) || StringUtil.checkString(rentAreaFrom)) {
//			sql.append(" INNER JOIN rentarea ON rentarea.buildingid = b.id ");
//		}
    }

    public static void queryNormal(BuildingSearchBuilder buildingSearchBuilder, StringBuilder where) {

        try {
            Field[] fields = BuildingSearchBuilder.class.getDeclaredFields();

            for (Field item : fields) {

                item.setAccessible(true);
                String fName = item.getName();

//                if (!fName.equals("staffId") && !fName.equals("typeCode") && !fName.startsWith("area")
//                        && !fName.startsWith("rental_price")) {
                if (!fName.equals("staffId") && !fName.equals("typeCode")) {
                    Object value = item.get(buildingSearchBuilder);

                    if (value == null) {
                        continue;
                    }

                    if (value instanceof String
                            && ((String) value).trim().isEmpty()) {
                        continue;
                    }

                    if (fName.equals("district")) {

                        where.append(" AND b.")
                                .append(fName)
                                .append(" = '")
                                .append(value)
                                .append("' ");

                    } else if (item.getType().getName().equals("java.lang.Long")
                            || item.getType().getName().equals("java.lang.Integer")) {

                        where.append(" AND b." + fName + " = " + value);

                    } else {

                        where.append(" AND b." + fName + " LIKE '%" + value + "%' ");

                    }
                }


            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Special là để jion với bảng khác
    public static void querySpecial(BuildingSearchBuilder buildingSearchBuilder, StringBuilder where) {

        Long staffId = buildingSearchBuilder.getStaffId();

        if (staffId != null) {
            where.append(" AND assignmentbuilding.staffid = " + staffId);
        }

        Long rentAreaFrom = buildingSearchBuilder.getAreaFrom();
        Long rentAreaTo = buildingSearchBuilder.getAreaTo();

        if (rentAreaFrom != null || rentAreaTo != null) {

            where.append(" AND EXISTS (SELECT * FROM rentarea r WHERE b.id = r.buildingid ");

            if (rentAreaFrom != null) {
                where.append(" AND r.value >= " + rentAreaFrom);
            }
            if (rentAreaTo != null) {
                where.append(" AND r.value <= " + rentAreaTo);
            }

            where.append(") ");
        }

        Long rentPriceFrom = buildingSearchBuilder.getRentPriceFrom();
        Long rentPriceTo = buildingSearchBuilder.getRentPriceTo();

        if (rentPriceFrom != null || rentPriceTo != null) {

            if (rentPriceFrom != null) {
                where.append(" AND b.rentprice >= " + rentPriceFrom);
            }
            if (rentPriceTo != null) {
                where.append(" AND b.rentprice >= " + rentPriceTo);
            }
        }
        // java 8
        List<String> typeCode = buildingSearchBuilder.getTypeCode();
        if (typeCode != null && typeCode.size() != 0) {
            where.append(" AND (");
            String sql = typeCode.stream().map(it -> "renttype.code like " + "'%" + it + "%'")
                    .collect(Collectors.joining(" OR "));
            where.append(sql);
            where.append(" ) ");
        }
    }
}
