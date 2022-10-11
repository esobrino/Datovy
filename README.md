# Datovy

## <span style="color:skyblue;font-weight:bold">INTRODUCTION</span>
The purpose of this effort is to provide free and accessible base database schema for healthcare contract tracing in a design suitable for data analitics and big data while being adaptable and flexible enough for daily on-line transaction processing.

## <span style="color:skyblue;font-weight:bold">NAMING CONVENTION</span>
To ease the identification of modeled artifacts all names had been arranged with the primary topic or entity at the begining followed by secondary topics or entities, follow by attributes or other descriptor.

For example:
- A Person name will begin with what it is "Name" followed by what part of the name it is "Given", "Middle" or "Family" name components.
- The Peson education details are written starting with "Education" followed by what we will like to know about the "Degree" followed by what kind it is "Highest".

This convention follows a welknown AI patterns "Entity - Attribute - Value" (EAV) to represent knowledge that can be easily used in inference systems and others.  To minimize confusion each word that represents an entity, attribute, verb or other is by its own separated with an underscore.

## <span style="color:skyblue">Abbreviations and Compound Words</span>
Whle abbreviations are discouraged as needed use them surrounded by underscores.  Finally, as possible all compound words are avoided but if used keept to a minimum.  Preferably if any of those are used those should conform to well known abbreviations or compunds, or accepted by the target community.

## <span style="color:skyblue;font-weight:bold">DATABASE DESIGN CONSIDERATIONS</span>
Within a relational database data entities (tables) are detailed using a reference based schema with the objective to reduce the amount of objects being modeled.

## <span style="color:skyblue">Non-identifying Relationships</span>
For example, instead of adding a "Note" table for each data entity, only one is provided.  With the use of "non-identifying relationships" a reference ID will point to the corresponding entity and using a relationship qualifier the reference-entity of interest is being stated.

## <span style="color:skyblue">Table Partitioning</span>
Onece those tables grow to a considerable size the table should be partitioned to improve performance.