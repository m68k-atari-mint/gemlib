ARG BUILD_DIR=/build

FROM mikrosk/m68k-atari-mint-base:master as base

WORKDIR /src
COPY build.sh .

# renew the arguments
ARG BUILD_DIR

ENV GEMLIB_BRANCH	    master
ENV GEMLIB_URL		    https://github.com/freemint/gemlib/archive/refs/heads/${GEMLIB_BRANCH}.tar.gz
ENV GEMLIB_FOLDER       gemlib-${GEMLIB_BRANCH}
RUN wget -q -O - ${GEMLIB_URL} | tar xzf -

RUN cd ${GEMLIB_FOLDER} \
    && ../build.sh ${BUILD_DIR}

FROM scratch

# renew the arguments
ARG BUILD_DIR

COPY --from=base ${BUILD_DIR} /
