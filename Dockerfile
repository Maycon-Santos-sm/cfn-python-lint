#-----------------------------------------------------------------------------------------
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License. See LICENSE in the project root for license information.
#-----------------------------------------------------------------------------------------

FROM amazonlinux:2

# Install Python 3
RUN yum -y update && \
    yum -y install python3

ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/root/.local/bin

RUN pip3 install --user cfn-lint
RUN mkdir /workspace
WORKDIR /workspace

# Set the default shell to bash rather than sh
ENV SHELL /bin/bash

# Set the entrypoint
ENTRYPOINT ["cfn-lint"]
CMD ["--help"]
