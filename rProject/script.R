
handler <- function(...) {
    requestInfo <- list(...) # This list will contain all the request parameters
    # Request info parameters received -  
    # resource,path,httpMethod,headers,multiValueHeaders,queryStringParameters,
    # multiValueQueryStringParameters,pathParameters,stageVariables,requestContext,body,isBase64Encoded]
    
    # print(requestInfo)
    print("Hi from lambda")
    return(list(
        statusCode = 200,
        body = "Hi from the R Lambda Function :)"
    ))
}
