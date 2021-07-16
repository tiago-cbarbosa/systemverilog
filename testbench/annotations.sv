$ -> tasks
$dysplay("Hello, my value in decimal is %d", var_a)
$finish
$stop
$exit
$time - ex $display("Simulation error at time %t in output a with value %d", out_a);
$random

// Numbers
integer 5, 55, -44;
integer  4'd5, -4'd5; // bit limited

real 0.2, 3.2 , 34e6; // not common used
time 10ns, 20.2ns; // 10 ns wrong, there is no space between number and unit

// variables
value -> 0, 1, X, Z
2 state variable - bit, int 
4 state variable -  logic, reg, integer, time
signed and unsigned:
    int unsigned ui;
    int signed si;

string variable -> e_name[=initial_value];
    funcs: len(), putc(), getc(), toupeer(), tolower(), compare(), substr(), atoi(),
            atohex(), atooct(), atobin()
            itoa(), hextoa(), atoocot(), atobin()
            string str = "123"
            int i = str.atoi(); // assigns 123 to i

// user defined type
typedef reg[7:0] octet;
    octet b;
typedef enum{red, green, blue} Colors;
typedef enum{red=10, green=30, blue=50} Colors;
    Colors c = blue;
    initial begin
        $display("%s = d%d \n", c.name, c);
    end
// struct and class
    typedef struct{
        bit [7:0] opcode;
        bit [23:0] addr;
    } packet;
    class packet;
        int address;
        bit[63:0] data;
        function new();
        function bitsend();
    endclass: packet

// Arrays
logic [15:0] arr; // packed array - fixed size - type = bit, logic, reg, wire
logic arr [15:0]; // unpaced array - dynamic array


// assignments
continuos -> assign
Procedural: 
    always, always_comb, always_latch, always_ff 
    initial 
    final 
    task 
    function 

// flow control and lopping
// used, in always, inital, final, task and function
    if(conditon)begin
    end esle if(condition2) begin
    end else begin
    end

    case(statement)
    val_0: begin
    end
    default: begin
    end

    while (conditon) begin
    end

    do begin
    end while(condition)
    
    for(int i=0;i<10;i++) begin
    end

    foreach (array_name) begin // for each element in array
    end

    repeat (number_of_loop) begin
    end

// Functions
function returned_data_type function_name (argments)  --> void if not return
    argment_list: input, output, inout, ref
    function logic [15:0] my_func(input int x,y, input logic [15:0] add);
    // not consume simulation time
    return val_1;
    endfunction: my_func

//tasks: similar to funciotns but can consume simulation time
    task my_task(input int x,y, input logic [15:0] add);
    // do not return
    endtask: my_task

// sequential and paralell execution
    //sequential
    begin
        #20 r = 11;
        #30 r = 12;
    end
    //parallel
    fork
        #20 r = 11;
        #30 r = 12;
    join
    // mixed
    fork
        begin            
        end
        begin 
        end
    join
    // join types
    join: wait the whole process complete
    join_any: wait one process complete
    join_none: do not wait
    //used after join:
    disable fork: kills all the child process
    wait fork: wait for child process to completes



    semaphore s1;// share var between tasks. Methods: new(), get(), put(), try_get.

    // Event

    event e1;
    ->e1; // trigger event
    @e1; // wait for event
    wait(e1.triggered); // wait for event
