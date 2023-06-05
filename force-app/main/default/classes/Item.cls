public class Item implements Comparable {
    public Object sourceObject { get; set; }
    public List<SortCriterion> criteria { get; set; }

    public Map<String, Object> fieldValueMap {
        get {
            if (this.fieldValueMap == null) {
                this.fieldValueMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(sourceObject, true));
            }
            return this.fieldValueMap;
        }
        set;
    }

    public Item(Object sourceObject, List<SortCriterion> criteria) {
        this.sourceObject = sourceObject;
        this.criteria = criteria;
    }

    public Integer compareTo(Object compareTo) {
        Item compareToEmp = (Item) compareTo;
        // Циклом по всем полям
        for (SortCriterion sc : this.criteria) {
            Integer comparisonResult = sc.compare(getValue(sc.fieldName), compareToEmp.getValue(sc.fieldName));
            if (comparisonResult == 0) {
                continue;
            }
            return comparisonResult;
        }
        return 0;
    }

    private Object getValue(String fieldName) {
        return this.fieldValueMap.get(fieldName);
    }
}
