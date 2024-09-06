/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 - Variable types: integer, float, boolean
 - Variable assignment
 - Printing variables
 - Variable checking
 
 In the assignment:
 - Add four more knots
 - Assign at least TWO new variables through player choices
 - Print at least one of the variables to the player in a passage
 - Check the value of a variable and have it do something
*/


VAR health = 5
VAR friend_name = ""
VAR weapons = 0
VAR keys = 0
VAR bravery = 0


-> memory

== memory == 
As you stand in front of the school, you wish your best friend was with you now. The abandoned school might be less scary then. What is your bes friend's name?

*[Lilah] 
~ friend_name = "Lilah"
-> school_entrance
*[Dex]
~ friend_name = "Dex"
-> school_entrance
*[Moxxie]
~ friend_name = "Moxxie"
-> school_entrance

-> school_entrance

== school_entrance ==
You are at the entrance to an abandoned school. {not key_pickup:There is a key on the floor.} You also have a phone with a flashlight. The school has hallways that extends to the north, south, east and west.You also have the choice to go back home before its too late... 


If only {friend_name} was here...

You have {keys} keys
{keys == 1: Since you have 1 key, you can now unlock the east hallway door!}
{keys == 2: Since you have 2 keys, you can now unlock the north hallway door!}
{keys == 3: Since you have 3 keys, you can now unlock the south hallway door!}
+[Take the east hallway] -> east_hallway
+[Take the west hallway] -> west_hallway
+[Take the north hallway] -> north_hallway
+[Take the south hallway] -> south_hallway
+[Go home] -> home
*[Pick up the key] -> key_pickup

== east_hallway ==
You are in the east hallway. It is very dark, you can't see anything.
+[Light hallway] -> east_hallway_lit
+ [Go Back] -> school_entrance
-> END

== west_hallway ==
You are in the west hallway
+ [Go Back] -> school_entrance
-> END

== north_hallway ==
You are in the north hallway. It is very dark, you can't see anything.
+[Light hallway] -> north_hallway_lit
+ [Go Back] -> school_entrance
-> END

== south_hallway ==
You are in the south hallway.It is very dark, you can't see anything.
+[Light hallway] -> south_hallway_lit
+ [Go Back] -> school_entrance
-> END

==home==
You go back home and decided to go back to sleep!!!
-> END

=== key_pickup ===
~ keys = keys + 1
You now have a key. May it open locked doors!
+[Go Back] ->school_entrance
-> END

==east_hallway_lit ==
The light reveals a door. The door is locked.
{not keys ==1:  Maybe you need to find another key somewhere...}
*{keys == 1} [Open door] -> east_door_open
+[Go Back] ->school_entrance



== east_door_open == 
The room reveals a bunch of dead bodies. There is also a key on the floor.
{ friend_name == "Dex": Dex would have been so scared if they were here|}
*[Pick up the key] -> key_pickup
+[Go Back] ->school_entrance
-> END

==north_hallway_lit ==
The light reveals a door.{not knife_pickup: The door is locked.There is also a knife on the floor.}
{keys !=2:  Maybe you need to find another key or keys somewhere...}
+{keys == 2} [Open door] ->north_door_open
*[Pick up the knife] -> knife_pickup
+ [Go Back] -> school_entrance

== knife_pickup ==
~ weapons = weapons + 1
You now have a knife. May it protect you from whatever lurks in the dark..
+[Go Back] -> north_hallway_lit

==north_door_open ==
The room reveals a bunch of monsters!! What will you do?
+{weapons == 1} [attack]-> attack
*[Run] -> run


== attack ==
~ weapons = weapons -1
You have {weapons} weapons left
~ bravery = bravery + 10
You have {bravery} bravery!

The monsters died from the knife! You survived the attack. You also found another key! Maybe this can open a locked door in one of the hallways..
*[Pick up the key] -> key_pickup
+[Go Back] ->school_entrance
-> END

==run==
~health = health - 1
The monsters attacked you and you lost some health. rip.
You have {health} health left
+[Go Back to the school entrance] ->school_entrance

->END

== south_hallway_lit ==
The light reveals a door. { keys !=3: The door is locked. Maybe you need to find another key or keys somewhere...}
*{keys == 3} [Open door] -> south_door_open
+[Go Back to the school entrance] ->school_entrance


== south_door_open ==
The door reveals {friend_name} ! why are they here...
{not knife_pickup2:There is also a knife on the ground.}
{friend_name} says they know a way out.. do you trust them?
*[Pick up the knife] -> knife_pickup2


*[Yes] -> trust_friend
*[no] -> dont_trust_friend
->END

== knife_pickup2 ==
~ weapons = weapons + 1
You now have a knife. May it protect you from whatever lurks in the dark..
+[Go Back] -> south_door_open

== trust_friend ==
~health = health - 1
{friend_name} turned out to be a monster and attacked you
-> END

== dont_trust_friend == 
{friend_name} turned out to be a monster! What will you do?
+{weapons == 1} [attack]-> attack
*[Run] -> run
-> END





