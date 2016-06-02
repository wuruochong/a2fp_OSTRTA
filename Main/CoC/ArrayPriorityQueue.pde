/*
NOTE:
This class has methods that are defined in the Java PriorityQueue API that were not implemented
when we wrote a PriorityQueue class for class homework. (e.g. contains(), iterator(), etc.)

This may give the impression that the methods in the class are "breaking" the rules of a priority
queue, but they are indeed not.
*/

import java.util.ArrayList;
import java.util.Iterator;
import java.util.NoSuchElementException;

public class ArrayPriorityQueue<T> implements Iterable {
    /** Instance Variables **/
    ArrayList<Comparable> _queue; //reversely ordered; dequeue from end of array

    /** Default Constructor **/
    public ArrayPriorityQueue() {
	_queue = new ArrayList<Comparable>();
    }
    
    /** Iterator **/
    public Iterator<Comparable> iterator() {
	return _queue.iterator();
    }

    /** Methods **/
    /** add - adds comparable c to the _queue, such that the highest priority 
     *  element is at the end of the _queue array (which gets dequeued first)
     **/
    public void add(Comparable c) {
	_queue.add(c);
	// move c to the right position, such that element to the left is the
	// latest element with lower priority
	for (int i = _queue.size()-1; i > 0; i--) {
	    if (c.compareTo(_queue.get(i-1)) < 0)
		return;
	    else 
		swap(i, i-1); // bubble sort towards correct position
	}
    }

    /** removeTop() - dequeues the smallest element of the queue **/
    public Comparable removeTop() {
	if (isEmpty())
	    throw new NoSuchElementException();
	return _queue.remove(_queue.size()-1); // Removes last element
    }

    /** peekTop() - returns the next element to be dequeued from the queue **/
    public Comparable peekTop() {
	if (isEmpty())
	    throw new NoSuchElementException();
	return _queue.get(_queue.size()-1);
    }

    /** remove(object o) - removes the specified object from the queue, specified in API **/
    public boolean remove(Comparable o) {
	return _queue.remove(o);
    }
    
    // returns true if queue contains comparable o
    public boolean contains(Comparable o){
	return _queue.contains(o);
    }
	
    /** isEmpty - returns a boolean indicating whether the queue is empty **/
    public boolean isEmpty() {
	return _queue.size() == 0;
    }

    /** swap - swaps locations of two objects in _queue **/
    private void swap(int j, int k) {
	Comparable tmp = _queue.get(j);
	_queue.set(j, _queue.get(k));
	_queue.set(k, tmp);
    }

    /** toString - overwrites existing toString() method **/
    public String toString(){
	return _queue.toString();
    }

}