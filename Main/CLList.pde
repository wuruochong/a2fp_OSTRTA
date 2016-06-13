/*****************************************************
 * class CLList 
 * implements a circularly-linked list of doubly-linked nodes
 ******************************************************/

public class CLList<T> {

    // only 1 head/tail/front/end pointer is necessary,
    // since the list is circularly-linked
    private DLLNode<T> _head;
    private int _size = 0;

    public CLList() {
	_head = null;
	_size = 0;
    }

    public int size() { return _size; }

    public boolean add( T x ) {

	if ( size() == 0 ) {
	    _head = new DLLNode<T>( x, null, null );
	    _head.setNext( _head );
	    _head.setPrev( _head );
	}
	else {
	    DLLNode<T> oldLast = _head.getPrev();

	    // insert new node between head and oldLast
	    _head.setPrev( new DLLNode<T>( x, oldLast, _head) );
	    oldLast.setNext( _head.getPrev() );
        }
	_size++;

	return true;
    }


    public T get( int index ) {

	DLLNode<T> tmp = _head;

	for( int i = 0; i < index % size(); i++ )
	    tmp = tmp.getNext();

	return tmp.getValue();
    }


    public T set( int index, T newVal ) {

	T foo;
	DLLNode<T> tmp = _head;

	for( int i = 0; i < index % size(); i++ )
	    tmp = tmp.getNext();

	foo = tmp.setValue( newVal );
	
	return foo;
    }


    public String toString() {
	String foo = "HEAD-> ";
	DLLNode<T> tmp = _head;
	for( int i = 0; i < _size; i++ ) {
	    foo += tmp.getValue() + " <-> ";
	    tmp = tmp.getNext();
	}
	if ( foo.length() > 7 )
	    foo = foo.substring( 0, foo.length() - 5 );
	foo += " <--...back to HEAD";
	return foo;
    }


    public static void main( String[] args ) {

	CLList<String> liz = new CLList<String>();

	liz.add("kenneth");
	liz.add("jack");
	liz.add("tracy");

	System.out.println(liz);

	System.out.println("\ntesting get()...");
	for( int i = 0; i < liz._size; i++ ) {
	    System.out.println("node " + i + " contains " + liz.get(i) );
	    System.out.println(liz);
	}

	System.out.println("\ntesting set()...");
	for( int i = 0; i < liz._size; i++ ) {
	    System.out.println( liz.set( i, "rock"+i ) );
	    System.out.println(liz);
	}

    }//end main

}//end class CLList
