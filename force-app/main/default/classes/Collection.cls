/**
 * Description
 *
 * @author: Olya Baranova
 * @date: 01/06/2023
 *
 */
public with sharing class Collection {
    public static Object sort(List<Object> objects, SortCriterion criterion) {
        return sort(objects, new List<SortCriterion>{ criterion });
    }

    public static Object sort(List<Object> objects, List<SortCriterion> criteria) {
        List<Item> items = wrapObjects(objects, criteria);
        items.sort();
        return unwrapObjects(items, objects);
    }

    private static List<Item> wrapObjects(List<Object> objects, List<SortCriterion> criteria) {
        List<Item> items = new List<Item>();
        for (Object obj : objects) {
            items.add(new Item(obj, criteria));
        }
        return items;
    }

    private static List<Object> unwrapObjects(List<Item> items, List<Object> objects) {
        for (Integer i = 0; i < objects.size(); i++) {
            objects[i] = items[i].sourceObject;
        }
        return objects;
    }
}
