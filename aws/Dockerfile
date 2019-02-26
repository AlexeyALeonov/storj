FROM anigeo/awscli:latest
ARG aws_access_key_id=49JXVWnHdHpqudqgpZoZta5ckkUQ
ARG aws_secret_access_key=3fcVFXMtchWajHoKynTw27zyuqCL
RUN aws configure set default.aws_access_key_id ${aws_access_key_id} \
    && aws configure set default.aws_secret_access_key ${aws_secret_access_key} \
    && aws configure set default.s3.multipart_threshold 1TB
