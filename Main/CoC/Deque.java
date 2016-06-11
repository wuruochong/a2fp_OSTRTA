// Calvin Vuong
// APCS2 pd10
// HW28 -- All Hands on Deque
// 2016-04-07

/*******************
Modifications from class Queue
1. There are now two pointers, one that points to the front of the queue, and the other to the back.
2. The enqueue() and dequeue() methods have been replaced with the enqueueFront(), dequeueFront() ( which adds/removes an element from the front of the queue, respectively ), enqueueBack(), dequeueBack() ( which adds/removes an element from the back of the queue, respectively ).
3. There is a now a peekBack() method in addition to the peekFront(). The peekBack() method returns the value of the node at the back of the queue.
*******************/
public class Deque<T> {
    
    private DLLNode<T> _front;
    private DLLNode<T> _end;
    private int _size;

    public Deque() {
	_front = _end = null;
	_size = 0; 
    } 

    public void enqueueFront( T x ){
	if ( isEmpty() ) // x will be first element
	    _front = _end = new DLLNode<T>(x, null, null); // prev and next point to null

	else{
	    DLLNode<T> newNode = new DLLNode<T>(x, null, _front);
	    _front.setPrev(newNode);
	    _front = newNode;
	}
	_size += 1;
    } //O(1)

    public void enqueueBack( T x ) {
	if ( isEmpty() ) // x will e first element
	    _end = _front = new DLLNode<T>(x, null, null); // prev and next point to null
	else{
	    DLLNode<T> newNode = new DLLNode<T>(x, _end, null);
	    _end.setNext(newNode);
	    _end = newNode;
	}
	_size += 1;
    } //O(1)
    
    public T dequeueFront() {
	T retVal = peekFront();
	if ( _size <= 1 )
	    _front = _end = null;
	else{
	    _front = _front.getNext(); // move pointer to next element down
	    _front.setPrev(null); // new front does not point to a previous value
	}
	_size -= 1;
	return retVal;
    } //O(1)

    public T dequeueBack() {
	T retVal = peekBack();
	if ( _size <= 1 )
	    _front = _end = null;
	else{
	    _end = _end.getPrev(); // move pointer to next element before
	    _end.setNext(null); // new end does not point to a previous value
	}
	_size -= 1;
	return retVal;
    } //O(1)
    
    public boolean isEmpty() {
	return _size == 0;
    } //O(1)

    public T peekFront() {
	return _front.getCargo();
    } //O(1)
    
    public T peekBack() {
	return _end.getCargo();
    } //O(1)

    public String toString() {
	String retStr = "";
	DLLNode<T> tmp = _front;
	while ( tmp != null ){
	    retStr += tmp.getCargo() + " --> ";
	    tmp = tmp.getNext();
	}
	return retStr;
    } //O(n)

    public static void main(String[] args) {
	Deque<String> queue = new Deque<String>();
	
	queue.enqueueFront("1");
	System.out.println(queue);
	System.out.println(queue.dequeueBack());
	System.out.println(queue);

	queue.enqueueFront("2");
	queue.enqueueFront("1");
	System.out.println(queue);
	System.out.println(queue.dequeueFront());
	System.out.println(queue.dequeueBack());
	System.out.println(queue);

	queue.enqueueFront("name");
	queue.enqueueBack("is");
	queue.enqueueFront("my");
	queue.enqueueBack("Calvin");
	queue.enqueueFront("hi");
	System.out.println(queue);

	System.out.println(queue.dequeueBack());
	System.out.println(queue.dequeueFront());
	System.out.println(queue);
    }
}