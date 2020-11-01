# Docker containers for teaching Analytics

## Structure

```
---+ python:3.6.9-minimal
   +--- python:3.6.9-ml
   \--- hadoop:2.8.5-pseudo
        +--- hadoop:2.8.5-local
        +--- hive:2.3.6-pseudo
        |    +--- hive:2.3.6-local
        +--- mahout:0.13.0-pseudo 
        |    +--- mahout:0.13.0-local
        +--- pig:0.17.0-pseudo
        |    +--- pig:0.17.0-local
        +--- spark:2.4.4-pseudo
             +--- pyspark:2.4.4-pseudo
                  +--- pyspark:2.4.4-local

```