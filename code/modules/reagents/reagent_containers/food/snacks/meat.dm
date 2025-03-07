/obj/item/reagent_containers/food/snacks/meat
	name = "meat"
	desc = "A slab of meat."
	icon_state = "meat"
	health = 180
	filling_color = "#ff1c1c"
	center_of_mass = "x=16;y=14"
	New()
		..()
		reagents.add_reagent(/datum/reagent/nutriment/protein, 6)
		src.bitesize = 3

/obj/item/reagent_containers/food/snacks/meat/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W,/obj/item/material/knife))
		new /obj/item/reagent_containers/food/snacks/rawcutlet(src)
		new /obj/item/reagent_containers/food/snacks/rawcutlet(src)
		new /obj/item/reagent_containers/food/snacks/rawcutlet(src)
		to_chat(user, "You cut the meat into thin strips.")
		qdel(src)
	else
		..()

/obj/item/reagent_containers/food/snacks/meat/syntiflesh
	name = "synthetic meat"
	desc = "A synthetic slab of flesh."

// Seperate definitions because some food likes to know if it's human.
// TODO: rewrite kitchen code to check a var on the meat item so we can remove
// all these sybtypes.
/obj/item/reagent_containers/food/snacks/meat/human
/obj/item/reagent_containers/food/snacks/meat/monkey
	//same as plain meat

/obj/item/reagent_containers/food/snacks/meat/corgi
	name = "corgi meat"
	desc = "Tastes like... well, you know. Cook first!"

	New()
		..()
		reagents.add_reagent(/datum/reagent/toxin/blattedin, 10)
		bitesize = 3

/obj/item/reagent_containers/food/snacks/meat/beef
	name = "beef slab"
	desc = "The classic red meat. Cook first!"

	New()
		..()
		reagents.add_reagent(/datum/reagent/toxin/blattedin, 10)
		bitesize = 3

/obj/item/reagent_containers/food/snacks/meat/goat
	name = "chevon slab"
	desc = "Goat meat, to the uncultured. Cook first!"

	New()
		..()
		reagents.add_reagent(/datum/reagent/toxin/blattedin, 10)
		bitesize = 3

/obj/item/reagent_containers/food/snacks/meat/grox
	name = "slab of grox meat"
	desc = "A delicacy across the Imperium of Man, tastes especially good when roasted over a campfire. Cook first!"
	sales_price = 10

	New()
		..()
		reagents.add_reagent(/datum/reagent/toxin/blattedin, 10)
		reagents.add_reagent(/datum/reagent/nutriment/protein, 9)
		bitesize = 3

/obj/item/reagent_containers/food/snacks/meat/chicken
	name = "chicken piece"
	desc = "It tastes like you'd expect. Cook it first!"

	New()
		..()
		reagents.add_reagent(/datum/reagent/toxin/blattedin, 10)
		reagents.add_reagent(/datum/reagent/nutriment/protein, 9)

/obj/item/reagent_containers/food/snacks/meat/roachmeat
	name = "roach meat"
	desc = "Gross piece of roach meat."
	icon_state = "xenomeat"
	filling_color = "#e2ffde"
	center_of_mass ="x=17;y=13"

	New()
		..()
		reagents.add_reagent(/datum/reagent/toxin/blattedin, 10)
		bitesize = 6

/obj/item/reagent_containers/food/snacks/meat/rat_meat
	name = "rat meat"
	desc = "It's gross... but sometimes that's as good as you're getting."

/obj/item/reagent_containers/food/snacks/meat/rat_meat/attackby(obj/item/W, mob/user)

	if(istype(W, /obj/item/stack/barbwire))
		var/obj/item/stack/barbwire/B = W
		B.amount--
		if(B.amount==0)
			qdel(B)
		new /obj/item/reagent_containers/food/snacks/skewered_rat_meat(src)
		to_chat(user, "You skewer the rat meat on a piece of barbed wire.")
		qdel(src)
		return TRUE
	else
		. = ..()



/obj/item/campfire/attackby(var/obj/item/reagent_containers/food/snacks/O, var/mob/user)
	if(O.iscooked == 1)
		to_chat(user, "<span class='warning'>[O] has already been cooked!</span>")
		return
	if(lit == 0)
		to_chat(user, "<span class='warning'>You need to light the campfire!</span>")
		return
	else
		playsound(src, 'sound/effects/roastingmeat.ogg', 70, 0, 1)
		do_after(user, 50, src)
		O.name = "roasted [O.name]"
		visible_message("[O] lets off a delicious smell as it crackles over the fire.")
		O.bitesize = 5
		O.iscooked = 1
		O.reagents.remove_reagent(/datum/reagent/toxin/blattedin, 10)
		O.reagents.add_reagent(/datum/reagent/nutriment/protein, 9)
		O.desc = "Roasted and safe to eat, smells delicious!"