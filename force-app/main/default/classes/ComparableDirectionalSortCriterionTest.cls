@IsTest
private class ComparableDirectionalSortCriterionTest {
    @IsTest
    public static void testAscendingNullsFirst() {
        List<Parent> objects = (List<Parent>) Collection.sort(
                getObjects(),
                new List<SortCriterion>{
                        new StringDirectionalSortCriterion('name', true, true),
                        new ComparableDirectionalSortCriterion('child', Child.class, true, true)
                }
        );

        Assert.areEqual(
                JSON.serialize(
                        new List<Parent>{
                                new Parent(null, null),
                                new Parent(null, new Child(null)),
                                new Parent(null, new Child('Antony')),
                                new Parent(null, new Child('Zoe')),
                                new Parent('Alex', null),
                                new Parent('Alex', new Child(null)),
                                new Parent('Alex', new Child('Antony')),
                                new Parent('Alex', new Child('Zoe')),
                                new Parent('Zed', null),
                                new Parent('Zed', new Child(null)),
                                new Parent('Zed', new Child('Antony')),
                                new Parent('Zed', new Child('Zoe'))
                        }
                ),
                JSON.serialize(objects)
        );
    }

    @IsTest
    public static void testAscendingNullsLast() {
        List<Parent> objects = (List<Parent>) Collection.sort(
                getObjects(),
                new List<SortCriterion>{
                        new StringDirectionalSortCriterion('name', true, false),
                        new ComparableDirectionalSortCriterion('child', Child.class, true, false)
                }
        );

        Assert.areEqual(
                JSON.serialize(
                        new List<Parent>{
                                new Parent('Alex', new Child(null)),
                                new Parent('Alex', new Child('Antony')),
                                new Parent('Alex', new Child('Zoe')),
                                new Parent('Alex', null),
                                new Parent('Zed', new Child(null)),
                                new Parent('Zed', new Child('Antony')),
                                new Parent('Zed', new Child('Zoe')),
                                new Parent('Zed', null),
                                new Parent(null, new Child(null)),
                                new Parent(null, new Child('Antony')),
                                new Parent(null, new Child('Zoe')),
                                new Parent(null, null)
                        }
                ),
                JSON.serialize(objects)
        );
    }

    @IsTest
    public static void testComplexCriteria() {
        List<Parent> objects = (List<Parent>) Collection.sort(
                getObjects(),
                new List<SortCriterion>{
                        new StringDirectionalSortCriterion('name', true, false),
                        new ComparableDirectionalSortCriterion('child', Child.class, false, true)
                }
        );

        Assert.areEqual(
                JSON.serialize(
                        new List<Parent>{
                                new Parent('Alex', null),
                                new Parent('Alex', new Child('Zoe')),
                                new Parent('Alex', new Child('Antony')),
                                new Parent('Alex', new Child(null)),
                                new Parent('Zed', null),
                                new Parent('Zed', new Child('Zoe')),
                                new Parent('Zed', new Child('Antony')),
                                new Parent('Zed', new Child(null)),
                                new Parent(null, null),
                                new Parent(null, new Child('Zoe')),
                                new Parent(null, new Child('Antony')),
                                new Parent(null, new Child(null))
                        }
                ),
                JSON.serialize(objects)
        );
    }

    private static List<Parent> getObjects() {
        return new List<Parent>{
                new Parent('Zed', new Child('Zoe')),
                new Parent('Zed', new Child('Antony')),
                new Parent('Zed', new Child(null)),
                new Parent('Zed', null),
                new Parent('Alex', new Child('Antony')),
                new Parent('Alex', new Child('Zoe')),
                new Parent('Alex', new Child(null)),
                new Parent('Alex', null),
                new Parent(null, new Child('Zoe')),
                new Parent(null, new Child('Antony')),
                new Parent(null, new Child(null)),
                new Parent(null, null)
        };
    }

    private class Parent {
        public String name { get; private set; }
        public Child child { get; private set; }

        public Parent(String name, Child child) {
            this.name = name;
            this.child = child;
        }
    }

    private class Child implements Comparable {
        public String name { get; private set; }

        public Child(String name) {
            this.name = name;
        }

        public Integer compareTo(Object compareTo) {
            Child otherChild = (Child) compareTo;
            // nulls first implementation
            if (this.name == null || otherChild.name == null) {
                return this.name == otherChild.name ? 0 : (otherChild.name == null ? 1 : -1);
            }
            // name comparison
            return this.name.compareTo(otherChild.name);
        }
    }
}
