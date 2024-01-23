package br.nathan.api.controllers;

import br.nathan.api.config.Configuration;
import br.nathan.api.models.Employee;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Tag(name = "Employee", description = "This is the endpoints for employee with id, first and last name")
@RestController
@RequestMapping("/api/employee")
@CrossOrigin("*")
public class EmployeeController {
    private final Configuration config = new Configuration();

    @Operation(summary = "Retrieve all employees", description = "Get all employees", tags = {"Employees"})
    @ApiResponses({
            @ApiResponse(responseCode = "200", content = {@Content(schema = @Schema(implementation = Employee.class), mediaType = "application/json")}),
            @ApiResponse(responseCode = "404", content = {@Content(schema = @Schema())})
    })
    @GetMapping()
    public ResponseEntity<List<Employee>> findAll(){
        return this.config.employeeService().findAll().size() > 0 ? ResponseEntity.ok(this.config.employeeService().findAll()) : ResponseEntity.notFound().build();
    }


    @Operation(summary = "Retrieve employee by id", description = "Get an employee by the id in the url", tags = {"Employee"})
    @ApiResponses({
            @ApiResponse(responseCode = "200", content = {@Content(schema = @Schema(implementation = Employee.class), mediaType = "application/json")}),
            @ApiResponse(responseCode = "404", content = {@Content(schema = @Schema())})
    })
    @GetMapping("/{id}")
    public ResponseEntity<Optional<Employee>> findById(@PathVariable("id")int id){
        return !this.config.employeeService().findById(id).isEmpty() ? ResponseEntity.ok(this.config.employeeService().findById(id)) : ResponseEntity.notFound().build();
    }


    @Operation(summary = "Add an employee", description = "Add an employee with the body in json", tags = {"Employees"})
    @ApiResponses({
            @ApiResponse(responseCode = "200", content = {@Content(schema = @Schema())}),
            @ApiResponse(responseCode = "400", content = {@Content(schema = @Schema())})
    })
    @PostMapping()
    public ResponseEntity post(@RequestBody Employee employee){
        return this.config.employeeService().save(employee) ? ResponseEntity.ok().build() : ResponseEntity.badRequest().build();
    }

    @Operation(summary = "Update an employee", description = "Update an employee with the body in json and the id in the url", tags = {"Employees"})
    @ApiResponses({
            @ApiResponse(responseCode = "200", content = {@Content(schema = @Schema())}),
            @ApiResponse(responseCode = "400", content = {@Content(schema = @Schema())})
    })
    @PutMapping("/{id}")
    public ResponseEntity put(@PathVariable("id")int id, @RequestBody Employee employee){
        return this.config.employeeService().update(id, employee) ? ResponseEntity.ok().build() : ResponseEntity.badRequest().build();
    }


    @Operation(summary = "Delete an employee", description = "Delete an employee with the id in the url", tags = {"Employees"})
    @ApiResponses({
            @ApiResponse(responseCode = "200", content = {@Content(schema = @Schema())}),
            @ApiResponse(responseCode = "400", content = {@Content(schema = @Schema())})
    })
    @DeleteMapping("/{id}")
    public ResponseEntity delete(@PathVariable("id")int id){
        return this.config.employeeService().deleteById(id) ? ResponseEntity.ok().build() : ResponseEntity.badRequest().build();
    }

}
