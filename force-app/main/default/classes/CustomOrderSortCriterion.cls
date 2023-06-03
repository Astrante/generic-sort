public virtual class CustomOrderSortCriterion extends SortCriterion {
    public List<Object> customOrder { get; set; }

    public CustomOrderSortCriterion(String fieldName, List<Object> customOrder, Boolean nullsFirst) {
        super(fieldName, nullsFirst);
        this.customOrder = customOrder;
    }

    public override Integer compare2(Object arg1, Object arg2) {
        Integer index1 = this.customOrder.indexOf(String.valueOf(arg1));
        Integer index2 = this.customOrder.indexOf(String.valueOf(arg2));
        return index1 == index2 ? 0 : index1 > index2 ? 1 : -1;
    }
}
