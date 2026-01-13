void main() {
    var firstName = "John";
    var lastName = "Doe";
    dynamic age = 19;
    print("Full name is $firstName $lastName $age");   
    age = "20";
    int num1 = 10; //declaring number1
    int num2 = 3; //declaring number2
    
    final list = [1,2,3,4,5,6];
    list.add(20);
    print(list);

    const list2 = [1,34,54];
    //list2.add(32); nem lehet
    print(list2);

    // Calculation
    int sum = num1 + num2;
    int diff = num1 - num2;
    int mul = num1 * num2;
    double div = num1 / num2; // It is double because it outputs number with decimal.
    
    // displaying the output
    print("The sum is $sum");
    print("The diff is $diff");
    print("The mul is $mul");
    print("The div is $div");
    print("The list first item: ${list[0]}");
    int age2 = int.parse(age);
    print("${age.runtimeType}"); 
}