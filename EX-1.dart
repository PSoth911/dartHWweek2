enum Skill { FLUTTER, DART, OTHER }

class Address {
  final String street;
  final String city;
  final String zipCode;

  Address({required this.street, required this.city, required this.zipCode});

  @override
  String toString() {
    return 'Street: $street, City: $city, Zip Code: $zipCode';
  }
}

class Employee {
  final String _name;
  final double _baseSalary;
  final List<Skill> _skills;
  final Address _address;
  final int _yearsOfExperience;

  Employee({
    required String this._name,
    required double this._baseSalary,
    required List<Skill> this._skills,
    required Address this._address,
    required int this._yearsOfExperience,
  });

  Employee.mobileDeveloper({
    required String this._name,
    required double this._baseSalary,
    required Address this._address,
    required int this._yearsOfExperience,
  }) : _skills = List.unmodifiable([Skill.FLUTTER, Skill.DART]);

  String get name => _name;
  double get baseSalary => _baseSalary;
  List<Skill> get skills => _skills;
  Address get address => _address;
  int get yearsOfExperience => _yearsOfExperience;

  double calculateSalary() {
    double salary = _baseSalary;

    salary += _yearsOfExperience * 2000;

    for (final skill in _skills) {
      if (skill == Skill.FLUTTER) {
        salary += 5000;
      } else if (skill == Skill.DART) {
        salary += 3000;
      } else if (skill == Skill.OTHER) {
        salary += 1000;
      }
    }
    return salary;
  }

  void printDetails() {
    print(
      'Employee: $name,\n Base Salary: \$${baseSalary},\n Skills: ${skills},\n Address, ${address},\n Years of Experience: ${yearsOfExperience},\n Total Salary: ${calculateSalary()}',
    );
  }
}

void main() {
  final address1 = Address(
    street: 'Street 1',
    city: 'Phnom Penh',
    zipCode: '12000',
  );

  final emp1 = Employee(
    name: 'Sokea',
    baseSalary: 40000,
    skills: [Skill.FLUTTER, Skill.DART],
    address: address1,
    yearsOfExperience: 2,
  );

  emp1.printDetails();
}
