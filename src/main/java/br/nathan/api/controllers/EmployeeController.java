package br.nathan.api.controllers;

import br.nathan.api.config.Configuration;
import br.nathan.api.models.Employee;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/employee")
public class EmployeeController {
    private final Configuration config = new Configuration();

    @GetMapping()
    public ResponseEntity<List<Employee>> findAll(){
        return this.config.employeeService().findAll().size() > 0 ? ResponseEntity.ok(this.config.employeeService().findAll()) : ResponseEntity.notFound().build();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Optional<Employee>> findById(@PathVariable("id")int id){
        return !this.config.employeeService().findById(id).isEmpty() ? ResponseEntity.ok(this.config.employeeService().findById(id)) : ResponseEntity.notFound().build();
    }

    @PostMapping()
    public ResponseEntity post(@RequestBody Employee employee){
        return this.config.employeeService().save(employee) ? ResponseEntity.ok().build() : ResponseEntity.badRequest().build();
    }

    @PutMapping("/{id}")
    public ResponseEntity put(@PathVariable("id")int id, @RequestBody Employee employee){
        return this.config.employeeService().update(id, employee) ? ResponseEntity.ok().build() : ResponseEntity.badRequest().build();
    }

    @DeleteMapping("/{id}")
    public ResponseEntity delete(@PathVariable("id")int id){
        return this.config.employeeService().deleteById(id) ? ResponseEntity.ok().build() : ResponseEntity.badRequest().build();
    }

}
