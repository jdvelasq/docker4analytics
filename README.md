# Docker containers for teaching Analytics

## Structure

```
---+ python:3.6.9-minimal
   +--- python:3.6.9-ml
   \--- hadoop:2.8.5-pseudo
        +--- hadoop:2.8.5-standalone
        +--- hive:2.3.6-pseudo
        |    +--- hive:2.3.6-standalone
        +--- mahout:0.13.0-pseudo 
        |    +--- mahout:0.13.0-standalone
        +--- pig:0.17.0-pseudo
        |    +--- pig:0.17.0-standalone
        +--- spark:2.4.4-pseudo
             +--- pyspark:2.4.4-pseudo
                  +--- pyspark:2.4.4-standalone

```