FROM nciccbr/ccbr_ubuntu_base_20.04:v1.4

ENV STAR_VERSION 2.7.10a
ENV RSEM_VERSION 1.3.3

# install star
WORKDIR /opt2
RUN wget --no-check-certificate https://github.com/alexdobin/STAR/archive/${STAR_VERSION}.tar.gz
RUN tar -xzf ${STAR_VERSION}.tar.gz
WORKDIR /opt2/STAR-${STAR_VERSION}/source
RUN make STAR
ENV PATH="/opt2/STAR-${STAR_VERSION}/source":$PATH

# install rsem
WORKDIR /opt2
RUN wget --no-check-certificate https://github.com/deweylab/RSEM/archive/refs/tags/v${RSEM_VERSION}.tar.gz
RUN tar -xzf v${RSEM_VERSION}.tar.gz
WORKDIR /opt2/RSEM-${RSEM_VERSION}
RUN make
RUN make ebseq
ENV PATH="/opt2/RSEM-${RSEM_VERSION}":$PATH

# cleanup etc
COPY Dockerfile /opt2/Dockerfile
RUN chmod a+rX /opt2/Dockerfile
WORKDIR /data2
RUN apt-get clean

# details
LABEL maintainer="vishal.koparde@nih.gov"
LABEL github_handle="kopardev"
ARG BUILD_DATE
LABEL build_date=$BUILD_DATE