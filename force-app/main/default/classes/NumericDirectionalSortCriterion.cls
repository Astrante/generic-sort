public class NumericDirectionalSortCriterion extends DirectionalSortCriterion {
    public NumericDirectionalSortCriterion(String fieldName, Boolean isAscending, Boolean nullsFirst) {
        super(fieldName, isAscending, nullsFirst);
    }

    public override Integer compare3(Object arg1, Object arg2) {
        return (arg1 == arg2 ? 0 : (Double) arg1 > (Double) arg2 ? 1 : -1);
    }
}
