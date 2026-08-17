{\rtf1\ansi\ansicpg1252\cocoartf2870
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 find_package(Qt6 REQUIRED COMPONENTS Core Network)\
\
file(WRITE $\{CMAKE_CURRENT_SOURCE_DIR\}/CoreManager.cpp "")\
\
add_library(CoreLib STATIC CoreManager.cpp)\
\
target_link_libraries(CoreLib PUBLIC Qt6::Core Qt6::Network)\
target_include_directories(CoreLib PUBLIC $\{CMAKE_CURRENT_SOURCE_DIR\})}