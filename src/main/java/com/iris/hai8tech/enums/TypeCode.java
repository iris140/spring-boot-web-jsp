package com.iris.hai8tech.enums;

import java.util.Map;
import java.util.TreeMap;

public enum TypeCode {

    TANG_TRET("Tầng trệt"),
    NGUYEN_CAN("Nguyên căn"),
    NOI_THAT("Nội thất");

    private final String typecodeName;

    TypeCode(String name) {
        this.typecodeName = name;
    }

    public static Map<String, String> typeCodeMap() {
        Map<String, String> typeCodes = new TreeMap<>();
        for (TypeCode it : TypeCode.values()) {
            typeCodes.put(it.toString(), it.typecodeName);
        }

        return typeCodes;
    }

}
