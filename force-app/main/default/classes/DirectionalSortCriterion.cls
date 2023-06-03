public abstract class DirectionalSortCriterion extends SortCriterion {
    public Boolean isAscending { get; set; }

    public DirectionalSortCriterion(String fieldName, Boolean isAscending, Boolean nullsFirst) {
        super(fieldName, nullsFirst);
        this.isAscending = isAscending;
    }

    public override Integer compare2(Object arg1, Object arg2) {
        return this.compare3(arg1, arg2) * (this.isAscending ? 1 : -1);
    }

    public abstract Integer compare3(Object arg1, Object arg2);
}
