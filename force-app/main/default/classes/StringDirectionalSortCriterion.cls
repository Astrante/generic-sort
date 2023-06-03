public virtual class StringDirectionalSortCriterion extends DirectionalSortCriterion {
    public StringDirectionalSortCriterion(String fieldName, Boolean isAscending, Boolean nullsFirst) {
        super(fieldName, isAscending, nullsFirst);
    }

    public override Integer compare3(Object arg1, Object arg2) {
        return String.valueOf(arg1).compareTo(String.valueOf(arg2));
    }
}
