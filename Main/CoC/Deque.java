import java.util.Iterator;
import java.util.NoSuchElementException;

public class Deque<T> implements Iterable<T>{
    
    private DLLNode<T> _front;
    private DLLNode<T> _end;
    private int _size;

    public Deque() {
	_front = _end = null;
	_size = 0; 
    } 

    // return iterator
    public Iterator<T> iterator() {
      return new MyIterator();
    }
    
    private class MyIterator implements Iterator<T>{

        private DLLNode<T> _dummy; // dummy node to tracking pos                                                                                                                                                   
        private boolean _okToRemove; //flag indicates next() was called                                                                                                                                            

        //constructor                                                                                                                                                                                              
        public MyIterator(){
            //place dummy node in front of head                                                                                                                                                                    
            _dummy = new DLLNode<T>( null, null, _front );
            _okToRemove = false;
        }

        //--------------v  Iterator interface methods  v-------------                                                                                                                                              
        //return true if iteration has more elements.                                                                                                                                                              
        public boolean hasNext(){
            return _dummy.getNext() != null;
        }

        //return next element in this iteration                                                                                                                                                                    
        public T next(){
            _dummy = _dummy.getNext();
            if ( _dummy == null )
                throw new NoSuchElementException();
            _okToRemove = true;
            return _dummy.getCargo();
        }
         //return last element returned by this iterator (from last next() call)                                                                                                                                    
        public void remove(){
            if ( ! _okToRemove )
                throw new IllegalStateException("must call next() beforehand");
            _okToRemove = false;

            //If removing only remaining node...                                                                                                                                                                   
            //maintain invariant that _dummy always points to a node                                                                                                                                               
            //   (...so that hasNext() will not crash)                                                                                                                                                             
            if ( _front == _end ) {
                _front = _end = null;
            }
            //if removing first node...                                                                                                                                                                            
            else if ( _front == _dummy ) {
                _front = _front.getNext();
                _front.setPrev( null ); //just to save mem                                                                                                                                                          
            }
            //if removing last node...                                                                                                                                                                             
            else if ( _end == _dummy ) {
                _end = _end.getPrev();
                _end.setNext( null );
            }
            //if removing an interior node...                                                                                                                                                                      
            else {
                _dummy.getNext().setPrev( _dummy.getPrev() );
                _dummy.getPrev().setNext( _dummy.getNext() );
                //Q: How could the line below cause trouble?                                                                                                                                                       
                //_dummy = _dummy.getPrev();                                                                                                                                                                       
            }

            _size--; //decrement size attribute of outer class LList                                                                                                                                               
        }
        //--------------^  Iterator interface methods  ^--------------                                                                                                                                             
    }//*************** end inner class MyIterator ***************                                                                                                                                                  


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

}