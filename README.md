# Generic Sort

## Description
This library provides a powerful and flexible sorting mechanism for collections in the Apex programming language. It allows you to sort complex objects based on multiple criteria, enabling you to easily customize the sorting behavior according to your specific requirements.

## Usage Example
Consider a scenario where you have a list of Person objects and you want to sort them based on various criteria. Here's an example of how you can achieve that using this library:

```Apex
List<Person> people = new List<Person>{
        new Person('Alex', 'Adams', 20, null),
        new Person('Alex', null, 20, Gender.FEMALE),
        new Person('Alex', 'Zimmerman', 20, Gender.FEMALE),
        new Person('Alex', 'Adams', 20, Gender.FEMALE)
};

List<SortCriterion> criteria = new List<SortCriterion>{
        new NumericDirectionalSortCriterion('age', true, false),
        new EnumCustomOrderSortCriterion('gender', new List<Object>{Gender.FEMALE, Gender.MALE}, true),
        new StringDirectionalSortCriterion('firstName', true, false),
        new StringDirectionalSortCriterion('lastName', false, true)
};

Collection.sort(people, criteria);
```

In this example, we have a list of Person objects and a list of SortCriterion objects. Each SortCriterion represents a specific sorting criterion such as numeric sorting, custom enum ordering, or string sorting. By specifying the desired sorting criteria and calling the Collection.sort method, the library sorts the people list accordingly.

## Class Diagram
![GenericSort.png](doc%2FGenericSort.png)
https://lucid.app/lucidchart/597a198e-7b8e-4fc7-8617-4fcaf75c7a9a/edit?viewport_loc=-515%2C-286%2C3538%2C1993%2C0_0&invitationId=inv_5c0ddc1e-689d-4e6e-a6d0-dc3e460c8c9d![GenericSort.png
