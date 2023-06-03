/**
 * Description
 *
 * @author: Olya Baranova
 * @date: 03/06/2023
 *
 */
public with sharing class EnumCustomOrderSortCriterion extends CustomOrderSortCriterion {
    public EnumCustomOrderSortCriterion(String fieldName, List<Object> customOrder, Boolean nullsFirst) {
        super(fieldName, prepareEnumValues(customOrder), nullsFirst);
    }

    private static List<String> prepareEnumValues(List<Object> enumValues) {
        List<String> enumStringValues = new List<String>();
        for (Object enumValue : enumValues) {
            enumStringValues.add(String.valueOf(enumValue));
        }
        return enumStringValues;
    }
}
