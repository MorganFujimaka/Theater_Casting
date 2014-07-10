##  This is an app to perform casting for the role in the theater.

### Firstly, we have to create a specific role:
captain_america_role = Role.new("Captain America", "male", 17..40)

(which means that only men in age from 17 till 40 are suitable for this role)

### Secondly, let's send an invitation to an actor (or just create one):
awesome_actor = Actor.new("Morgan", 26, "male")

(someone Morgan, 26 years old)

<<<<<<< HEAD
Secondly, let's send an invitation to an actor (or just create one :)):

awesome_actor = Actor.new("Morgan", 26, "male") (someone Morgan, 26 years old)


It's time to organize casting for Captain America role:

=======
### It's time to organize casting for Captain America role:
>>>>>>> bb77677d0816351995c938ded487e875e425b9ed
casting_captain_america = Casting.new(captain_america_role)

### As every casting we have a commision. Since our theater is pretty cool we have invited the brightest stars and here they are:
COMMISION = { "Jack Nicholson" => :male, "Mel Gibson" => :male, "Audrey Hepburn" => :female, "Kate Beckinsale" => :female, "Hugh Jackman" => :male }

### Every actor have prepared an action and beleive it guarantees him the role:
awesome_actor_action = Action.new("Fly", 30, "I beleive I can fly")

(During 30 minutes Morgan try to convince that he can fly, innocent guy...)

### Commission is thrilled to see what Morgan have prepared:
casting_captain_america.perform(awesome_actor, awesome_actor_action)

### Commission beware unsucceful candidates and sends its assessment in a personal letter after casting:
awesome_actor.actions (=> {:role=>"Captain America", :topic=>"Fly", :time=>30, :text=>"I beleive I can fly", :average=>5.8})

### Usually novice actors are not very confident in their abilities and do not rely on a single role. So, it's cool that after plenty of castings actor can see the most suitable role depending on average score:
awesome_actor.most_suitable_role

(=> You hold casting on different roles (Captain America, Iron Man), but the most suitable for you is Captain America.)

### Every actor would like to be on a stage as long as possible. Thanks us he can measure his success by average time on a stage:
awesome_actor.average_action_time

(=> Your average time on a stage is 30 minutes.)
