public class Planner{
  CLList<Day> _container;
  
  public Planner(){
    Day mon = new Day("Monday");
    Day tue = new Day("Tuesday");
    Day wed = new Day("Wednesday");
    Day thu = new Day("Thursday");
    Day fri = new Day("Friday");
    _container.add(mon);
    _container.add(tue);
    _container.add(wed);
    _container.add(thu);
    _container.add(fri);
  }
  
  