package br.nathan.api.services;

import br.nathan.api.models.Employee;
import br.nathan.api.port.EmployeeRepo;

import java.util.List;
import java.util.Optional;

public class EmployeeService {
    private final EmployeeRepo repo;

    public EmployeeService(EmployeeRepo repo) {
        this.repo = repo;
    }

    public List<Employee> findAll(){
        return this.repo.findAll();
    }

    public Optional<Employee> findById(int id){
        return this.repo.findById(id);
    }

    public boolean save(Employee employee){
        return this.repo.save(employee);
    }

    public boolean update(int id, Employee employee){
        return this.repo.update(id, employee);
    }

    public boolean deleteById(int id){
        return this.repo.deleteById(id);
    }

    public boolean existsById(int id){
        return this.repo.existsById(id);
    }

    public boolean existsByFirstNameAndLastName(Employee employee){
        return this.repo.existsByFirstNameAndLastName(employee.getFirstName(), employee.getLastName());
    }

}
