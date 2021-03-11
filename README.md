# awa_stromversorgungssicherheit

```
java -jar /Users/stefan/apps/ili2h2gis-4.5.0-SNAPSHOT/ili2h2gis-4.5.0-SNAPSHOT.jar --dbfile stromversorgungssicherheit --defaultSrsCode 2056 --nameByTopic --strokeArcs --models SupplySecurity_RuledAreas_V1_2 --schemaimport
```

```
java -jar /Users/stefan/apps/ili2h2gis-4.5.0-SNAPSHOT/ili2h2gis-4.5.0-SNAPSHOT.jar --dbfile stromversorgungssicherheit --defaultSrsCode 2056 --nameByTopic --strokeArcs --models SupplySecurity_RuledAreas_V1_2 --disableValidation --export fubar.xtf
```

```
java -jar /Users/stefan/apps/ili2pg-4.3.1/ili2pg-4.3.1.jar \
--dbschema awa_stromversorgungssicherheit --models SupplySecurity_RuledAreas_V1_2 \
--defaultSrsCode 2056 --createGeomIdx --createFk --createFkIdx --createUnique --createEnumTabs --beautifyEnumDispName --createMetaInfo --createNumChecks --nameByTopic --strokeArcs \
--createscript awa_stromversorgungssicherheit.sql


```