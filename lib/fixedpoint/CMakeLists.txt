FILE(GLOB_RECURSE LIBFIXEDPOINT_SRCS *.cpp)

INCLUDE_DIRECTORIES(
  ${CMAKE_CURRENT_SOURCE_DIR}
#	${CMAKE_CURRENT_SOURCE_DIR}/include
#	${CMAKE_CURRENT_SOURCE_DIR}/src
)

ADD_LIBRARY(libfixedpoint STATIC ${LIBFIXEDPOINT_SRCS})
# change the prefix, so we don't end up with liblibwarmux
SET_TARGET_PROPERTIES(libfixedpoint PROPERTIES PREFIX "")
