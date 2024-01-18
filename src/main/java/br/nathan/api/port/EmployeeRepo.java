package br.nathan.api.port;

import br.nathan.api.models.Employee;

import java.util.List;
import java.util.Optional;

public interface EmployeeRepo {
    List<Employee> findAll();

    Optional<Employee> findById(int id);

    boolean existsByFirstNameAndLastName(String firstName, String lastName);

    boolean existsById(int id);

    void save(Employee employee);

    void delete(Employee employee);

    void deleteById(int id);
}
