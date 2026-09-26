package com.iris.hai8tech.entity;

import javax.persistence.*;

@Entity
@Table(name = "assignmentbuilding")
public class AssignBuildingEntity {
    //public class AssignBuildingEntity extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "staffid")
    private UserEntity userEntity;

    @ManyToOne
    @JoinColumn(name = "buildingid")
    private BuildingEntity buildingEntity;

  public AssignBuildingEntity(UserEntity userEntity, BuildingEntity buildingEntity) {
      this.userEntity = userEntity;
      this.buildingEntity = buildingEntity;
  }

    public AssignBuildingEntity() {

    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public UserEntity getUserEntity() {
        return userEntity;
    }

    public void setUserEntity(UserEntity userEntity) {
        this.userEntity = userEntity;
    }

    public BuildingEntity getBuildingEntity() {
        return buildingEntity;
    }

    public void setBuildingEntity(BuildingEntity buildingEntity) {
        this.buildingEntity = buildingEntity;
    }
}