
handler <- function(...) {
    requestInfo <- list(...) # This list will contain all the request parameters
    # Request info parameters received -  
    # resource,path,httpMethod,headers,multiValueHeaders,queryStringParameters,
    # multiValueQueryStringParameters,pathParameters,stageVariables,requestContext,body,isBase64Encoded]
    
    # print(requestInfo)
    
    #print(requestInfo['httpMethod'])
    if(requestInfo['httpMethod'] == "GET") {
        fileName <- 'index.html'
        indexContents <- readChar(fileName, file.info(fileName)$size)
        return (list(
            statusCode = 200,
            headers = list("Content-Type" = "text/html"),
            body = indexContents
        ))
    }
    else if(requestInfo['httpMethod'] == "POST") {
        request = requestInfo["body"]
        responseContent <- toJSON(list(
                isComplete = TRUE,
                htmlFeedback = paste('<h2 style="color:green">User\'s response : </h2>', request, sep="<br/>"),
                textFeedback = paste("User's response : \n", request, sep=" "),
                jsonFeedback = request
            ), auto_unbox = TRUE)
        result <- list(
            statusCode = 200,
            headers = list("Content-Type" = "application/json"),
            body = responseContent
        )
        #print(result)
        return (result)
    }
    else {
        return (list(
            statusCode = 200,
            body = "Hi from the R Lambda Function :)"
        ))
    }
    
}
