@IsTest
private class StringDirectionalSortCriterionTest {
    @IsTest
    public static void testScenario1() {
        List<Person> people = getPeople();
        Scenario scenario = getScenario1();
        Collection.sort(shuffle(people), scenario.criteria);
        scenario.assertEqualsWithExpected(people);
    }

    private static Scenario getScenario1() {
        return new Scenario(
                new List<SortCriterion>{
                        new NumericDirectionalSortCriterion('age', true, false),
                        new EnumCustomOrderSortCriterion('gender', new List<Object>{ Gender.FEMALE, Gender.MALE}, true),
                        new StringDirectionalSortCriterion('firstName', true, false),
                        new StringDirectionalSortCriterion('lastName', false, true)
                },
                new List<Person>{
                        new Person('Alex', 'Adams', 20, null),
                        new Person('Alex', null, 20, Gender.FEMALE),
                        new Person('Alex', 'Zimmerman', 20, Gender.FEMALE),
                        new Person('Alex', 'Adams', 20, Gender.FEMALE),
                        new Person('Charlie', 'Zimmerman', 20, Gender.FEMALE),
                        new Person('Charlie', 'Adams', 20, Gender.FEMALE),
                        new Person(null, 'Adams', 20, Gender.FEMALE),
                        new Person('Alex', 'Zimmerman', 20, Gender.MALE),
                        new Person('Alex', 'Adams', 20, Gender.MALE),
                        new Person('Charlie', 'Zimmerman', 20, Gender.MALE),
                        new Person('Charlie', 'Adams', 20, Gender.MALE),
                        new Person('Alex', 'Zimmerman', 21, Gender.FEMALE),
                        new Person('Alex', 'Adams', 21, Gender.FEMALE),
                        new Person('Charlie', 'Zimmerman', 21, Gender.FEMALE),
                        new Person('Charlie', 'Adams', 21, Gender.FEMALE),
                        new Person('Alex', 'Zimmerman', 21, Gender.MALE),
                        new Person('Alex', 'Adams', 21, Gender.MALE),
                        new Person('Charlie', 'Zimmerman', 21, Gender.MALE),
                        new Person('Charlie', 'Adams', 21, Gender.MALE),
                        new Person('Alex', 'Adams', null, Gender.FEMALE)
                }
        );
    }

    @IsTest
    public static void testScenario2() {
        List<Person> people = getPeople();
        Scenario scenario = getScenario2();
        List<Person> sortedPeople = (List<Person>) Collection.sort(shuffle(people), scenario.criteria);
        scenario.assertEqualsWithExpected(sortedPeople);
    }

    private static Scenario getScenario2() {
        return new Scenario(
                new List<SortCriterion>{
                        new EnumCustomOrderSortCriterion('gender', new List<Object>{ Gender.MALE, Gender.FEMALE}, true),
                        new StringDirectionalSortCriterion('firstName', false, false),
                        new StringDirectionalSortCriterion('lastName', true, true),
                        new NumericDirectionalSortCriterion('age', true, false)
                },
                new List<Person>{
                        new Person('Alex', 'Adams', 20, null),
                        new Person('Charlie', 'Adams', 20, Gender.MALE),
                        new Person('Charlie', 'Adams', 21, Gender.MALE),
                        new Person('Charlie', 'Zimmerman', 20, Gender.MALE),
                        new Person('Charlie', 'Zimmerman', 21, Gender.MALE),
                        new Person('Alex', 'Adams', 20, Gender.MALE),
                        new Person('Alex', 'Adams', 21, Gender.MALE),
                        new Person('Alex', 'Zimmerman', 20, Gender.MALE),
                        new Person('Alex', 'Zimmerman', 21, Gender.MALE),
                        new Person('Charlie', 'Adams', 20, Gender.FEMALE),
                        new Person('Charlie', 'Adams', 21, Gender.FEMALE),
                        new Person('Charlie', 'Zimmerman', 20, Gender.FEMALE),
                        new Person('Charlie', 'Zimmerman', 21, Gender.FEMALE),
                        new Person('Alex', null, 20, Gender.FEMALE),
                        new Person('Alex', 'Adams', 20, Gender.FEMALE),
                        new Person('Alex', 'Adams', 21, Gender.FEMALE),
                        new Person('Alex', 'Adams', null, Gender.FEMALE),
                        new Person('Alex', 'Zimmerman', 20, Gender.FEMALE),
                        new Person('Alex', 'Zimmerman', 21, Gender.FEMALE),
                        new Person(null, 'Adams', 20, Gender.FEMALE)
                }
        );
    }

    private static List<Person> getPeople() {
        return new List<Person>{
                new Person(null, 'Adams', 20, Gender.FEMALE),
                new Person('Alex', null, 20, Gender.FEMALE),
                new Person('Alex', 'Adams', null, Gender.FEMALE),
                new Person('Alex', 'Adams', 20, null),
                new Person('Alex', 'Adams', 20, Gender.FEMALE),
                new Person('Alex', 'Zimmerman', 21, Gender.FEMALE),
                new Person('Alex', 'Zimmerman', 21, Gender.MALE),
                new Person('Charlie', 'Adams', 21, Gender.FEMALE),
                new Person('Alex', 'Adams', 20, Gender.MALE),
                new Person('Charlie', 'Adams', 20, Gender.FEMALE),
                new Person('Charlie', 'Zimmerman', 20, Gender.FEMALE),
                new Person('Charlie', 'Zimmerman', 20, Gender.MALE),
                new Person('Alex', 'Adams', 21, Gender.FEMALE),
                new Person('Alex', 'Adams', 21, Gender.MALE),
                new Person('Charlie', 'Adams', 21, Gender.MALE),
                new Person('Charlie', 'Adams', 20, Gender.MALE),
                new Person('Alex', 'Zimmerman', 20, Gender.FEMALE),
                new Person('Alex', 'Zimmerman', 20, Gender.MALE),
                new Person('Charlie', 'Zimmerman', 21, Gender.FEMALE),
                new Person('Charlie', 'Zimmerman', 21, Gender.MALE)
        };
    }

    private static List<Person> shuffle(List<Person> people) {
        people.sort();
        return people;
    }

    private class Scenario {
        List<SortCriterion> criteria;
        List<Person> expectedResult;
        public Scenario(List<SortCriterion> criteria, List<Person> expectedResult) {
            this.criteria = criteria;
            this.expectedResult = expectedResult;
        }

        public void assertEqualsWithExpected(List<Person> actualResult) {
            Assert.areEqual(JSON.serialize(this.expectedResult), JSON.serialize(actualResult));
        }
    }

    private class Person implements Comparable {
        public String firstName { get; set; }
        public String lastName { get; set; }
        public Integer age { get; set; }
        public Gender gender { get; set; }

        public Person(String firstName, String lastName, Integer age, Gender gender) {
            this.firstName = firstName;
            this.lastName = lastName;
            this.age = age;
            this.gender = gender;
        }

        public Integer compareTo(Object unused) {
            return (Integer) Math.floor(Math.random() * 3 - 1);
        }
    }

    private enum Gender {
        MALE,
        FEMALE
    }

}
