# Dockerfile
 
# Use the official AWS Lambda Python runtime as the base image
FROM public.ecr.aws/lambda/python:3.8
 
# Copy the Lambda function code into the container
COPY hello_world.py ${LAMBDA_TASK_ROOT}
 
# Set the CMD to your handler (could also be done as a parameter override outside of the Dockerfile)
CMD [ "hello_world.lambda_handler" ]