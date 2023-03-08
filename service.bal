import ballerina/http;

# A service representing a network-accessible API
# bound to port `9090`.
service / on new http:Listener(9090) {

    # A resource for generating greetings
    # + name - the input string name
    # + return - string name with hello message or error
    resource function post greeting(string name) returns http:Response|error? {

        // Send a response back to the caller.
        http:Response response = new;

        if name is "" {
            return error("name should not be empty!");
        }

        response.setJsonPayload("Hello, " + name);
        response.statusCode = http:OK;
        return response;
    }
}
