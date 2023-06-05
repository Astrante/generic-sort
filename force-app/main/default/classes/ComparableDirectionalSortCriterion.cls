public class ComparableDirectionalSortCriterion extends DirectionalSortCriterion {
    public Type apexClass { get; set; }

    public ComparableDirectionalSortCriterion(String fieldName, Type apexClass, Boolean isAscending, Boolean nullsFirst) {
        super(fieldName, isAscending, nullsFirst);
        this.apexClass = apexClass;
    }

    public override Integer compare3(Object arg1, Object arg2) {
        Comparable comparable1 = getSourceFieldValue(arg1);
        Comparable comparable2 = getSourceFieldValue(arg2);
        return (comparable1).compareTo(comparable2);
    }

    private Comparable getSourceFieldValue(Object fieldValue) {
        return (Comparable) JSON.deserialize(JSON.serialize(fieldValue), this.apexClass);
    }
}
