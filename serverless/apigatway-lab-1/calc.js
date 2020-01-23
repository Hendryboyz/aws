console.log('Loading the Cal function');

exports.handler = (event, context, callback) => {
    console.log('Received event: ', JSON.stringify(event, null, 2));
    if (event.a === undefined || event.b === undefined || event.op === undefined) {
        callback("400 Bad Request: Invalid Input");
    }

    if (isNaN(event.a) || isNaN(event.b)) {
        callback("400 Bad Request: Invalid Operand");    
    }

    var res = {};
    res.a= Number(event.a);
    res.b = Number(event.b);
    res.op = event.op;
    res.c = calculate(res.a, res.op, res.b);

    if (isNaN(res.c)) {
        callback("400 Bad Request: Invalid Operator");
    }
    else {
        callback(null, res);
    }
};

function calculate(numberA, operator, numberB) {
    switch(operator) {
        case "+":
            return numberA + numberB; 
        case "-":
            return numberA - numberB;
        case "*":
            return numberA * numberB;
        case "/":
            return numberA / numberB;
        default:
            return "";
    }
}