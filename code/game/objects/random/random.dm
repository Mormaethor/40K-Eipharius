/obj/random
	name = "random object"
	desc = "This item type is used to spawn random objects at round-start."
	icon = 'icons/misc/mark.dmi'
	icon_state = "rup"
	var/spawn_nothing_percentage = 0 // this variable determines the likelyhood that this random object will not spawn anything

	var/spawn_method = /obj/random/proc/spawn_item

// creates a new object and deletes itself
/obj/random/Initialize()
	..()
	call(src, spawn_method)()
	return INITIALIZE_HINT_QDEL

// creates the random item
/obj/random/proc/spawn_item()
	if(prob(spawn_nothing_percentage))
		return

	if(isnull(loc))
		return

	var/build_path = pickweight(spawn_choices())

	var/atom/A = new build_path(src.loc)
	if(pixel_x || pixel_y)
		A.pixel_x = pixel_x
		A.pixel_y = pixel_y

// Returns an associative list in format path:weight
/obj/random/proc/spawn_choices()
	return list()

/obj/random/single
	name = "randomly spawned object"
	desc = "This item type is used to randomly spawn a given object at round-start."
	icon_state = "x3"
	var/spawn_object = null

/obj/random/single/spawn_choices()
	return list(ispath(spawn_object) ? spawn_object : text2path(spawn_object))

/obj/random/tool
	name = "random tool"
	desc = "This is a random tool."
	icon = 'icons/obj/items.dmi'
	icon_state = "welder"

/obj/random/tool/spawn_choices()
	return list(/obj/item/screwdriver,
				/obj/item/wirecutters,
				/obj/item/weldingtool,
				/obj/item/weldingtool/largetank,
				/obj/item/crowbar,
				/obj/item/wrench,
				/obj/item/device/flashlight)

/obj/random/technology_scanner
	name = "random scanner"
	desc = "This is a random technology scanner."
	icon = 'icons/obj/device.dmi'
	icon_state = "atmos"

/obj/random/technology_scanner/spawn_choices()
	return list(/obj/item/device/t_scanner = 5,
				/obj/item/device/radio = 2,
				/obj/item/device/analyzer = 5)

/obj/random/trap
	name = "random trap"
	desc = "This is a random landmine."
	icon = 'icons/obj/warfare.dmi'
	icon_state = "mine_item"
	spawn_nothing_percentage = 50

/obj/random/trap/spawn_choices()
	return list(/obj/structure/landmine = 50)

/obj/random/powercell
	name = "random powercell"
	desc = "This is a random powercell."
	icon = 'icons/obj/power.dmi'
	icon_state = "hcell"

/obj/random/powercell/spawn_choices()
	return list(/obj/item/cell/crap = 1,
				/obj/item/cell = 8,
				/obj/item/cell/high = 5,
				/obj/item/cell/super = 2,
				/obj/item/cell/hyper = 1,
				/obj/item/cell/device/standard = 7,
				/obj/item/cell/device/high = 5)

/obj/random/bomb_supply
	name = "bomb supply"
	desc = "This is a random bomb supply."
	icon = 'icons/obj/assemblies/new_assemblies.dmi'
	icon_state = "signaller"

/obj/random/bomb_supply/spawn_choices()
	return list(/obj/item/device/assembly/igniter,
				/obj/item/device/assembly/prox_sensor,
				/obj/item/device/assembly/signaler,
				/obj/item/device/assembly/timer,
				/obj/item/device/multitool)

/obj/random/toolbox
	name = "random toolbox"
	desc = "This is a random toolbox."
	icon = 'icons/obj/storage.dmi'
	icon_state = "red"

/obj/random/toolbox/spawn_choices()
	return list(/obj/item/storage/toolbox/mechanical = 30,
				/obj/item/storage/toolbox/electrical = 20,
				/obj/item/storage/toolbox/emergency = 20,
				/obj/item/storage/toolbox/syndicate = 1)

/obj/random/tech_supply
	name = "random tech supply"
	desc = "This is a random piece of technology supplies."
	icon = 'icons/obj/power.dmi'
	icon_state = "cell"
	spawn_nothing_percentage = 50

/obj/random/tech_supply/spawn_choices()
	return list(/obj/random/powercell = 3,
				/obj/random/technology_scanner = 2,
				/obj/item/packageWrap = 1,
				/obj/item/hand_labeler = 1,
				/obj/random/bomb_supply = 2,
				/obj/item/extinguisher = 1,
				/obj/item/clothing/gloves/insulated/cheap = 1,
				/obj/item/stack/cable_coil/random = 2,
				/obj/random/toolbox = 2,
				/obj/item/storage/belt/utility = 2,
				/obj/item/storage/belt/utility/atmostech = 1,
				/obj/random/tool = 5,
				/obj/item/tape_roll = 2)

/obj/random/medical
	name = "Random Medical equipment"
	desc = "This is a random medical item."
	icon = 'icons/obj/items.dmi'
	icon_state = "traumakit"

/obj/random/medical/spawn_choices()
	return list(/obj/random/medical/lite = 21,
				/obj/item/bodybag = 2,
				/obj/item/reagent_containers/glass/bottle/inaprovaline = 2,
				/obj/item/reagent_containers/glass/bottle/antitoxin = 2,
				/obj/item/storage/pill_bottle = 2,
				/obj/item/storage/pill_bottle/tramadol = 1,
				/obj/item/storage/pill_bottle/citalopram = 2,
				/obj/item/storage/pill_bottle/dexalin_plus = 1,
				/obj/item/storage/pill_bottle/dermaline = 1,
				/obj/item/storage/pill_bottle/bicaridine = 1,
				/obj/item/reagent_containers/syringe/antitoxin = 2,
				/obj/item/reagent_containers/syringe/antiviral = 1,
				/obj/item/reagent_containers/syringe/inaprovaline = 2,
				/obj/item/storage/box/freezer = 1,
				/obj/item/stack/nanopaste = 1)

/obj/random/tapes
	name = "Random Boombox tapes"
	desc = "This is a boombox tape"
	icon = 'icons/obj/cassette.dmi'
	icon_state = "cassette_0"

/obj/random/tapes/spawn_choices()
	return list(/obj/item/device/cassette/tape1 = 1,
				/obj/item/device/cassette/tape2 = 1,
				/obj/item/device/cassette/tape3 = 1)

/obj/random/medical/lite
	name = "Random Medicine"
	desc = "This is a random simple medical item."
	icon = 'icons/obj/items.dmi'
	icon_state = "brutepack"
	spawn_nothing_percentage = 25

/obj/random/medical/lite/spawn_choices()
	return list(/obj/item/stack/medical/bruise_pack = 4,
				/obj/item/stack/medical/ointment = 4,
				/obj/item/storage/pill_bottle/antidexafen = 2,
				/obj/item/storage/pill_bottle/paracetamol = 2,
				/obj/item/stack/medical/advanced/bruise_pack = 2,
				/obj/item/stack/medical/advanced/ointment = 2,
				/obj/item/stack/medical/splint = 1,
				/obj/item/bodybag/cryobag = 1,
				/obj/item/reagent_containers/hypospray/autoinjector = 3,
				/obj/item/storage/pill_bottle/kelotane = 2,
				/obj/item/storage/pill_bottle/antitox = 2)

/obj/random/firstaid
	name = "Random First Aid Kit"
	desc = "This is a random first aid kit."
	icon = 'icons/obj/storage.dmi'
	icon_state = "firstaid"

/obj/random/firstaid/spawn_choices()
	return list(/obj/item/storage/firstaid/regular = 4,
				/obj/item/storage/firstaid/toxin = 3,
				/obj/item/storage/firstaid/o2 = 3,
				/obj/item/storage/firstaid/adv = 2,
				/obj/item/storage/firstaid/combat = 1,
				/obj/item/storage/firstaid/empty = 2,
				/obj/item/storage/firstaid/fire = 3)

/obj/random/contraband
	name = "Random Illegal Item"
	desc = "Hot Stuff."
	icon = 'icons/obj/items.dmi'
	icon_state = "purplecomb"
	spawn_nothing_percentage = 50

/obj/random/contraband/spawn_choices()
	return list(/obj/item/haircomb = 4,
				/obj/item/storage/pill_bottle/tramadol = 3,
				/obj/item/storage/pill_bottle/happy = 2,
				/obj/item/storage/pill_bottle/zoom = 2,
				/obj/item/reagent_containers/glass/beaker/vial/random/toxin = 1,
				/obj/item/reagent_containers/glass/beaker/sulphuric = 1,
				/obj/item/contraband/poster = 5,
				/obj/item/material/butterfly = 2,
				/obj/item/material/butterflyblade = 3,
				/obj/item/material/butterflyhandle = 3,
				/obj/item/material/wirerod = 3,
				/obj/item/melee/baton/cattleprod = 1,
				/obj/item/material/butterfly/switchblade = 1,
				/obj/item/material/hatchet/tacknife = 1,
				/obj/item/material/kitchen/utensil/knife/boot = 2,
				/obj/item/storage/secure/briefcase/money = 1,
				/obj/item/storage/box/syndie_kit/cigarette = 1,
				/obj/item/stack/telecrystal = 1,
				/obj/item/clothing/under/syndicate = 2,
				/obj/item/reagent_containers/syringe = 3,
				/obj/item/reagent_containers/syringe/steroid = 2,
				/obj/item/reagent_containers/syringe/drugs = 1)

/obj/random/drinkbottle
	name = "random drink"
	desc = "This is a random drink."
	icon = 'icons/obj/drinks.dmi'
	icon_state = "whiskeybottle"

/obj/random/drinkbottle/spawn_choices()
	return list(/obj/item/reagent_containers/food/drinks/bottle/whiskey,
				/obj/item/reagent_containers/food/drinks/bottle/gin,
				/obj/item/reagent_containers/food/drinks/bottle/specialwhiskey,
				/obj/item/reagent_containers/food/drinks/bottle/vodka,
				/obj/item/reagent_containers/food/drinks/bottle/tequilla,
				/obj/item/reagent_containers/food/drinks/bottle/absinthe,
				/obj/item/reagent_containers/food/drinks/bottle/wine,
				/obj/item/reagent_containers/food/drinks/bottle/cognac,
				/obj/item/reagent_containers/food/drinks/bottle/rum,
				/obj/item/reagent_containers/food/drinks/bottle/patron)

/obj/random/canned_food
	name = "random canned food"
	desc = "This is a random canned food"
	icon = 'icons/obj/food.dmi'
	icon_state = "cbeans"

/obj/random/canned_food/spawn_choices()
	return list(/obj/item/reagent_containers/food/snacks/warfare,
				/obj/item/reagent_containers/food/snacks/warfare/flower,
				/obj/item/reagent_containers/food/snacks/warfare/rat,
				/obj/item/reagent_containers/food/snacks/warfare/sardine)

/obj/random/bolt_action
	name = "Bolt Action Rifle"
	desc = "random bolties"

/obj/random/bolt_action/spawn_choices()
	return list(/obj/item/gun/projectile)

/obj/random/energy
	name = "Random Energy Weapon"
	desc = "This is a random energy weapon."
	icon = 'icons/obj/weapons/gun/energy.dmi'
	icon_state = "energykill100"

/obj/random/energy/spawn_choices()
	return list(/obj/item/gun/energy/laser = 4,
				/obj/item/gun/energy/gun = 3,
				/obj/item/gun/energy/lasercannon = 2,
				/obj/item/gun/energy/sniperrifle = 1,
				/obj/item/gun/energy/gun/nuclear = 1,
				/obj/item/gun/energy/ionrifle = 2,
				/obj/item/gun/energy/taser = 4,)

/obj/random/projectile
	name = "Random Projectile Weapon"
	desc = "This is a random projectile weapon."
	icon = 'icons/obj/weapons/gun/projectile.dmi'
	icon_state = "revolver"

/obj/random/projectile/spawn_choices()
	return list(/obj/item/gun/projectile)

/obj/random/handgun
	name = "Random Handgun"
	desc = "This is a random sidearm."
	icon = 'icons/obj/weapons/gun/projectile.dmi'
	icon_state = "secgundark"

/obj/random/handgun/spawn_choices()
	return list(/obj/item/gun/projectile = 3,
				/obj/item/gun/energy/gun = 2,)

/obj/random/ammo
	name = "Random Ammunition"
	desc = "This is random ammunition."
	icon = 'icons/obj/ammo.dmi'
	icon_state = "45-10"

/obj/random/ammo/spawn_choices()
	return list(/obj/item/storage/box/beanbags = 6,
				/obj/item/storage/box/shotgunammo = 2,
				/obj/item/storage/box/shotgunshells = 4,
				/obj/item/storage/box/stunshells = 1,
				/obj/item/ammo_magazine/mc9mmt = 2,)

/obj/random/action_figure
	name = "random action figure"
	desc = "This is a random action figure."
	icon = 'icons/obj/toy.dmi'
	icon_state = "assistant"

/obj/random/action_figure/spawn_choices()
	return list(/obj/item/toy/figure/cmo,
				/obj/item/toy/figure/assistant,
				/obj/item/toy/figure/atmos,
				/obj/item/toy/figure/bartender,
				/obj/item/toy/figure/borg,
				/obj/item/toy/figure/gardener,
				/obj/item/toy/figure/captain,
				/obj/item/toy/figure/cargotech,
				/obj/item/toy/figure/ce,
				/obj/item/toy/figure/chaplain,
				/obj/item/toy/figure/chef,
				/obj/item/toy/figure/chemist,
				/obj/item/toy/figure/clown,
				/obj/item/toy/figure/corgi,
				/obj/item/toy/figure/detective,
				/obj/item/toy/figure/dsquad,
				/obj/item/toy/figure/engineer,
				/obj/item/toy/figure/geneticist,
				/obj/item/toy/figure/hop,
				/obj/item/toy/figure/hos,
				/obj/item/toy/figure/qm,
				/obj/item/toy/figure/janitor,
				/obj/item/toy/figure/agent,
				/obj/item/toy/figure/librarian,
				/obj/item/toy/figure/md,
				/obj/item/toy/figure/mime,
				/obj/item/toy/figure/miner,
				/obj/item/toy/figure/ninja,
				/obj/item/toy/figure/wizard,
				/obj/item/toy/figure/rd,
				/obj/item/toy/figure/roboticist,
				/obj/item/toy/figure/scientist,
				/obj/item/toy/figure/syndie,
				/obj/item/toy/figure/secofficer,
				/obj/item/toy/figure/warden,
				/obj/item/toy/figure/psychologist,
				/obj/item/toy/figure/paramedic,
				/obj/item/toy/figure/ert)


/obj/random/plushie
	name = "random plushie"
	desc = "This is a random plushie."
	icon = 'icons/obj/toy.dmi'
	icon_state = "nymphplushie"

/obj/random/plushie/spawn_choices()
	return list(/obj/item/toy/plushie/nymph,
				/obj/item/toy/plushie/mouse,
				/obj/item/toy/plushie/kitten,
				/obj/item/toy/plushie/lizard)

/obj/random/plushie/large
	name = "random large plushie"
	desc = "This is a random large plushie."
	icon = 'icons/obj/toy.dmi'
	icon_state = "droneplushie"

/obj/random/plushie/large/spawn_choices()
	return list(/obj/structure/plushie/ian,
				/obj/structure/plushie/drone,
				/obj/structure/plushie/carp,
				/obj/structure/plushie/beepsky)

/obj/random/junk //Broken items, or stuff that could be picked up
	name = "random junk"
	desc = "This is some random junk."
	icon = 'icons/obj/trash.dmi'
	icon_state = "trashbag3"

/obj/random/junk/spawn_choices()
	return list(get_random_junk_type())

/obj/random/trash //Mostly remains and cleanable decals. Stuff a janitor could clean up
	name = "random trash"
	desc = "This is some random trash."
	icon = 'icons/effects/effects.dmi'
	icon_state = "greenglow"

/obj/random/trash/spawn_choices()
	return list(/obj/item/remains/lizard,
				/obj/effect/decal/cleanable/blood/gibs/robot,
				/obj/effect/decal/cleanable/blood/oil,
				/obj/effect/decal/cleanable/blood/oil/streak,
				/obj/item/remains/mouse,
				/obj/effect/decal/cleanable/vomit,
				/obj/effect/decal/cleanable/blood/splatter,
				/obj/effect/decal/cleanable/ash,
				/obj/effect/decal/cleanable/generic,
				/obj/effect/decal/cleanable/flour,
				/obj/effect/decal/cleanable/dirt,
				/obj/item/remains/robot)


obj/random/closet //A couple of random closets to spice up maint
	name = "random closet"
	desc = "This is a random closet."
	icon = 'icons/obj/closet.dmi'
	icon_state = "syndicate1"

obj/random/closet/spawn_choices()
	return list(/obj/structure/closet,
				/obj/structure/closet/firecloset,
				/obj/structure/closet/firecloset/full,
				/obj/structure/closet/emcloset,
				/obj/structure/closet/jcloset,
				/obj/structure/closet/athletic_mixed,
				/obj/structure/closet/toolcloset,
				/obj/structure/closet/l3closet/general,
				/obj/structure/closet/cabinet,
				/obj/structure/closet/crate,
				/obj/structure/closet/crate/freezer,
				/obj/structure/closet/crate/freezer/rations,
				/obj/structure/closet/crate/internals,
				/obj/structure/closet/crate/trashcart,
				/obj/structure/closet/crate/medical,
				/obj/structure/closet/boxinggloves,
				/obj/structure/largecrate,
				/obj/structure/closet/wardrobe/xenos,
				/obj/structure/closet/wardrobe/mixed,
				/obj/structure/closet/wardrobe/suit,
				/obj/structure/closet/wardrobe/orange)

/obj/random/coin
	name = "random coin"
	desc = "This is a random coin."
	icon = 'icons/obj/items.dmi'
	icon_state = "coin"

/obj/random/coin/spawn_choices()
	return list(/obj/item/coin/gold = 3,
				/obj/item/coin/silver = 4,
				/obj/item/coin/diamond = 2,
				/obj/item/coin/iron = 4,
				/obj/item/coin/uranium = 3,
				/obj/item/coin/platinum = 1,
				/obj/item/coin/phoron = 1)

/obj/random/toy
	name = "random toy"
	desc = "This is a random toy."
	icon = 'icons/obj/toy.dmi'
	icon_state = "ship"

/obj/random/toy/spawn_choices()
	return list(/obj/item/toy/bosunwhistle,
				/obj/item/toy/therapy_red,
				/obj/item/toy/therapy_purple,
				/obj/item/toy/therapy_blue,
				/obj/item/toy/therapy_yellow,
				/obj/item/toy/therapy_orange,
				/obj/item/toy/therapy_green,
				/obj/item/toy/cultsword,
				/obj/item/toy/katana,
				/obj/item/toy/snappop,
				/obj/item/toy/sword,
				/obj/item/toy/water_balloon,
				/obj/item/toy/crossbow,
				/obj/item/toy/blink,
				/obj/item/reagent_containers/spray/waterflower,
				/obj/item/toy/prize/ripley,
				/obj/item/toy/prize/fireripley,
				/obj/item/toy/prize/deathripley,
				/obj/item/toy/prize/gygax,
				/obj/item/toy/prize/durand,
				/obj/item/toy/prize/honk,
				/obj/item/toy/prize/marauder,
				/obj/item/toy/prize/seraph,
				/obj/item/toy/prize/mauler,
				/obj/item/toy/prize/odysseus,
				/obj/item/toy/prize/phazon,
				/obj/item/deck/cards)

/obj/random/tank
	name = "random tank"
	desc = "This is a tank."
	icon = 'icons/obj/tank.dmi'
	icon_state = "canister"

/obj/random/tank/spawn_choices()
	return list(/obj/item/tank/oxygen = 5,
				/obj/item/tank/oxygen/yellow = 4,
				/obj/item/tank/oxygen/red = 4,
				/obj/item/tank/air = 3,
				/obj/item/tank/emergency/oxygen = 4,
				/obj/item/tank/emergency/oxygen/engi = 3,
				/obj/item/tank/emergency/oxygen/double = 2,
				/obj/item/tank/emergency/nitrogen = 2,
				/obj/item/tank/emergency/nitrogen/double = 1,
				/obj/item/tank/nitrogen = 1,
				/obj/item/device/suit_cooling_unit = 1)

/obj/random/material //Random materials for building stuff
	name = "random material"
	desc = "This is a random material."
	icon = 'icons/obj/items.dmi'
	icon_state = "sheet-metal"

/obj/random/material/spawn_choices()
	return list(/obj/item/stack/material/steel/ten,
				/obj/item/stack/material/glass/ten,
				/obj/item/stack/material/glass/reinforced/ten,
				/obj/item/stack/material/plastic/ten,
				/obj/item/stack/material/wood/ten,
				/obj/item/stack/material/cardboard/ten,
				/obj/item/stack/rods/ten,
				/obj/item/stack/material/plasteel/ten,
				/obj/item/stack/material/steel/fifty,
				/obj/item/stack/material/glass/fifty,
				/obj/item/stack/material/glass/reinforced/fifty,
				/obj/item/stack/material/plastic/fifty,
				/obj/item/stack/material/wood/fifty,
				/obj/item/stack/material/cardboard/fifty,
				/obj/item/stack/rods/fifty,
				/obj/item/stack/material/plasteel/fifty)

/obj/random/soap
	name = "Random Cleaning Supplies"
	desc = "This is a random bar of soap. Soap! SOAP?! SOAP!!!"
	icon = 'icons/obj/items.dmi'
	icon_state = "soap"

/obj/random/soap/spawn_choices()
	return list(/obj/item/soap = 4,
				/obj/item/soap/nanotrasen = 3,
				/obj/item/soap/deluxe = 3,
				/obj/item/soap/syndie = 1,
				/obj/item/soap/gold = 1,
				/obj/item/reagent_containers/glass/rag = 2,
				/obj/item/reagent_containers/spray/cleaner = 2,
				/obj/item/grenade/chem_grenade/cleaner = 1)

obj/random/obstruction //Large objects to block things off in maintenance
	name = "random obstruction"
	desc = "This is a random obstruction."
	icon = 'icons/obj/cult.dmi'
	icon_state = "cultgirder"

obj/random/obstruction/spawn_choices()
	return list(/obj/structure/barricade,
				/obj/structure/girder,
				/obj/structure/girder/displaced,
				/obj/structure/girder/reinforced,
				/obj/structure/grille,
				/obj/structure/grille/broken,
				/obj/structure/foamedmetal,
				/obj/item/caution,
				/obj/item/caution/cone,
				/obj/structure/inflatable/wall,
				/obj/structure/inflatable/door)

/obj/random/assembly
	name = "random assembly"
	desc = "This is a random circuit assembly."
	icon = 'icons/obj/items.dmi'
	icon_state = "gift1"

/obj/random/assembly/spawn_choices()
	return list(/obj/item/device/electronic_assembly,
				/obj/item/device/electronic_assembly/medium,
				/obj/item/device/electronic_assembly/large,
				/obj/item/device/electronic_assembly/drone)

/obj/random/advdevice
	name = "random advanced device"
	desc = "This is a random advanced device."
	icon = 'icons/obj/items.dmi'
	icon_state = "game_kit"

/obj/random/advdevice/spawn_choices()
	return list(/obj/item/device/flashlight/lantern,
				/obj/item/device/flashlight/flare,
				/obj/item/device/flashlight/pen,
				/obj/item/device/toner,
				/obj/item/device/paicard,
				/obj/item/device/destTagger,
				/obj/item/beartrap,
				/obj/item/handcuffs,
				/obj/item/camera_assembly,
				/obj/item/device/camera,
				/obj/item/device/pda,
				/obj/item/card/emag_broken,
				/obj/item/device/radio/headset,
				/obj/item/device/flashlight/glowstick/yellow,
				/obj/item/device/flashlight/glowstick/orange)

/obj/random/smokes
	name = "random smokeable"
	desc = "This is a random smokeable item."
	icon = 'icons/obj/cigarettes.dmi'
	icon_state = "Bpacket"

/obj/random/smokes/spawn_choices()
	return list(/obj/item/storage/fancy/cigarettes = 5,
				/obj/item/storage/fancy/cigarettes/dromedaryco = 4,
				/obj/item/storage/fancy/cigarettes/killthroat = 1,
				/obj/item/storage/fancy/cigarettes/luckystars = 3,
				/obj/item/storage/fancy/cigarettes/jerichos = 3,
				/obj/item/storage/fancy/cigarettes/menthols = 2,
				/obj/item/storage/fancy/cigarettes/carcinomas = 3,
				/obj/item/storage/fancy/cigarettes/professionals = 2,
				/obj/item/storage/fancy/cigar = 1,
				/obj/item/clothing/mask/smokable/cigarette = 2,
				/obj/item/clothing/mask/smokable/cigarette/menthol = 2,
				/obj/item/clothing/mask/smokable/cigarette/cigar = 1,
				/obj/item/clothing/mask/smokable/cigarette/cigar/cohiba = 1,
				/obj/item/clothing/mask/smokable/cigarette/cigar/havana = 1)

/obj/random/masks
	name = "random mask"
	desc = "This is a random face mask."
	icon = 'icons/obj/clothing/masks.dmi'
	icon_state = "gas_mask"

/obj/random/masks/spawn_choices()
	return list(/obj/item/clothing/mask/gas = 4,
				/obj/item/clothing/mask/gas/half = 5,
				/obj/item/clothing/mask/gas/swat = 1,
				/obj/item/clothing/mask/gas/syndicate = 1,
				/obj/item/clothing/mask/breath = 6,
				/obj/item/clothing/mask/breath/medical = 4,
				/obj/item/clothing/mask/balaclava = 3,
				/obj/item/clothing/mask/balaclava/tactical = 2,
				/obj/item/clothing/mask/surgical = 4)

/obj/random/snack
	name = "random snack"
	desc = "This is a random snack item."
	icon = 'icons/obj/food.dmi'
	icon_state = "sosjerky"

/obj/random/snack/spawn_choices()
	return list(/obj/item/reagent_containers/food/snacks/liquidfood,
				/obj/item/reagent_containers/food/snacks/candy,
				/obj/item/reagent_containers/food/drinks/dry_ramen,
				/obj/item/reagent_containers/food/snacks/chips,
				/obj/item/reagent_containers/food/snacks/sosjerky,
				/obj/item/reagent_containers/food/snacks/no_raisin,
				/obj/item/reagent_containers/food/snacks/spacetwinkie,
				/obj/item/reagent_containers/food/snacks/cheesiehonkers,
				/obj/item/reagent_containers/food/snacks/tastybread,
				/obj/item/reagent_containers/food/snacks/candy/proteinbar,
				/obj/item/reagent_containers/food/snacks/syndicake,
				/obj/item/reagent_containers/food/snacks/donut,
				/obj/item/reagent_containers/food/snacks/donut/cherryjelly,
				/obj/item/reagent_containers/food/snacks/donut/jelly,
				/obj/item/pizzabox/meat,
				/obj/item/pizzabox/vegetable,
				/obj/item/pizzabox/margherita,
				/obj/item/pizzabox/mushroom,
				/obj/item/reagent_containers/food/snacks/plumphelmetbiscuit,
				/obj/item/reagent_containers/food/snacks/skrellsnacks)


/obj/random/storage
	name = "random storage item"
	desc = "This is a storage item."
	icon = 'icons/obj/storage.dmi'
	icon_state = "idOld"

/obj/random/storage/spawn_choices()
	return list(/obj/item/storage/secure/briefcase = 2,
				/obj/item/storage/briefcase = 4,
				/obj/item/storage/briefcase/inflatable = 3,
				/obj/item/storage/backpack = 5,
				/obj/item/storage/backpack/satchel = 5,
				/obj/item/storage/backpack/dufflebag = 2,
				/obj/item/storage/box = 5,
				/obj/item/storage/box/donkpockets = 3,
				/obj/item/storage/box/sinpockets = 1,
				/obj/item/storage/box/donut = 2,
				/obj/item/storage/box/cups = 3,
				/obj/item/storage/box/mousetraps = 4,
				/obj/item/storage/box/engineer = 3,
				/obj/item/storage/box/autoinjectors = 2,
				/obj/item/storage/box/beakers = 3,
				/obj/item/storage/box/syringes = 3,
				/obj/item/storage/box/gloves = 3,
				/obj/item/storage/box/large = 2,
				/obj/item/storage/box/glowsticks = 3,
				/obj/item/storage/wallet = 1,
				/obj/item/storage/ore = 2,
				/obj/item/storage/belt/utility/full = 2,
				/obj/item/storage/belt/medical/emt = 2,
				/obj/item/storage/belt/medical = 2,
				/obj/item/storage/belt/security = 2,
				/obj/item/storage/belt/security/tactical = 1)

/obj/random/shoes
	name = "random footwear"
	desc = "This is a random pair of shoes."
	icon = 'icons/obj/clothing/shoes.dmi'
	icon_state = "boots"

/obj/random/shoes/spawn_choices()
	return list(/obj/item/clothing/shoes/workboots = 3,
				/obj/item/clothing/shoes/jackboots = 3,
				/obj/item/clothing/shoes/jungleboots = 3,
				/obj/item/clothing/shoes/desertboots = 3,
				/obj/item/clothing/shoes/dutyboots = 3,
				/obj/item/clothing/shoes/leather = 4)

/obj/random/gloves
	name = "random gloves"
	desc = "This is a random pair of gloves."
	icon = 'icons/obj/clothing/gloves.dmi'
	icon_state = "rainbow"

/obj/random/gloves/spawn_choices()
	return list(/obj/item/clothing/gloves/insulated = 3,
				/obj/item/clothing/gloves/thick = 6,
				/obj/item/clothing/gloves/thick/botany = 5,
				/obj/item/clothing/gloves/latex = 4,
				/obj/item/clothing/gloves/thick/swat = 3,
				/obj/item/clothing/gloves/thick/combat = 3,
				/obj/item/clothing/gloves/white = 5,
				/obj/item/clothing/gloves/rainbow = 1,
				/obj/item/clothing/gloves/duty = 5,
				/obj/item/clothing/gloves/guards = 3,
				/obj/item/clothing/gloves/tactical = 3,
				/obj/item/clothing/gloves/insulated/cheap = 5)

/obj/random/glasses
	name = "random eyewear"
	desc = "This is a random pair of glasses."
	icon = 'icons/obj/clothing/glasses.dmi'
	icon_state = "leforge"

/obj/random/glasses/spawn_choices()
	return list(/obj/item/clothing/glasses/sunglasses = 3,
				/obj/item/clothing/glasses/regular = 7,
				/obj/item/clothing/glasses/meson = 5,
				/obj/item/clothing/glasses/meson/prescription = 4,
				/obj/item/clothing/glasses/science = 6,
				/obj/item/clothing/glasses/material = 5,
				/obj/item/clothing/glasses/welding = 3,
				/obj/item/clothing/glasses/hud/health = 4,
				/obj/item/clothing/glasses/hud/health/prescription = 3,
				/obj/item/clothing/glasses/hud/security = 4,
				/obj/item/clothing/glasses/hud/security/prescription = 3,
				/obj/item/clothing/glasses/sunglasses/sechud = 2,
				/obj/item/clothing/glasses/sunglasses/sechud/toggle = 3,
				/obj/item/clothing/glasses/sunglasses/sechud/goggles = 1,
				/obj/item/clothing/glasses/tacgoggles = 1)

/obj/random/accessory
	name = "random accessory"
	desc = "This is a random utility accessory."
	icon = 'icons/obj/clothing/ties.dmi'
	icon_state = "horribletie"

/obj/random/accessory/spawn_choices()
	return list(/obj/item/clothing/accessory/storage/webbing = 3,
				/obj/item/clothing/accessory/storage/webbing_large = 3,
				/obj/item/clothing/accessory/storage/black_vest = 2,
				/obj/item/clothing/accessory/storage/brown_vest = 2,
				/obj/item/clothing/accessory/storage/white_vest = 2,
				/obj/item/clothing/accessory/storage/bandolier = 1,
				/obj/item/clothing/accessory/holster/thigh = 1,
				/obj/item/clothing/accessory/holster/hip = 1,
				/obj/item/clothing/accessory/holster/waist = 1,
				/obj/item/clothing/accessory/holster/armpit = 1,
				/obj/item/clothing/accessory/kneepads = 3,
				/obj/item/clothing/accessory/stethoscope = 2)

/obj/random/cash
	name = "random currency"
	desc = "LOADSAMONEY!"
	icon = 'icons/obj/items.dmi'
	icon_state = "spacecash1"

/obj/random/cash/spawn_choices()
	return list(/obj/item/spacecash/bundle/c1 = 4,
				/obj/item/spacecash/bundle/c10 = 3,
				/obj/item/spacecash/bundle/c20 = 3,
				/obj/item/spacecash/bundle/c50 = 2,
				/obj/item/spacecash/bundle/c100 = 2,
				/obj/item/spacecash/bundle/c1000 = 1)

/obj/random/maintenance //Clutter and loot for maintenance and away missions
	name = "random maintenance item"
	desc = "This is a random maintenance item."
	icon = 'icons/obj/items.dmi'
	icon_state = "gift1"

/obj/random/maintenance/spawn_choices()
	return list(/obj/random/junk = 4,
				/obj/random/trash = 4,
				/obj/random/maintenance/clean = 5)

/obj/random/maintenance/clean
/*Maintenance loot lists without the trash, for use inside things.
Individual items to add to the maintenance list should go here, if you add
something, make sure it's not in one of the other lists.*/
	name = "random clean maintenance item"
	desc = "This is a random clean maintenance item."
	icon = 'icons/obj/items.dmi'
	icon_state = "gift2"

/obj/random/maintenance/clean/spawn_choices()
	return list(/obj/random/tech_supply = 100,
				/obj/random/medical = 40,
				/obj/random/medical/lite = 80,
				/obj/random/firstaid = 20,
				/obj/random/powercell = 50,
				/obj/random/technology_scanner = 80,
				/obj/random/bomb_supply = 80,
				/obj/random/contraband = 1,
				/obj/random/action_figure = 2,
				/obj/random/plushie = 2,
				/obj/random/material = 40,
				/obj/random/coin = 5,
				/obj/random/toy = 20,
				/obj/random/tank = 20,
				/obj/random/soap = 5,
				/obj/random/drinkbottle = 5,
				/obj/random/loot = 1,
				/obj/random/advdevice = 50,
				/obj/random/smokes = 30,
				/obj/random/masks = 10,
				/obj/random/snack = 60,
				/obj/random/storage = 30,
				/obj/random/shoes = 20,
				/obj/random/gloves = 10,
				/obj/random/glasses = 20,
				/obj/random/accessory = 20,
				/obj/random/cash = 10)

/obj/random/loot /*Better loot for away missions and salvage */
	name = "random loot"
	desc = "This is some random loot."
	icon = 'icons/effects/random_spawners.dmi'
	icon_state = "loot"

/obj/random/loot/spawn_choices()
	return list(/obj/random/energy = 10,
				/obj/random/projectile = 10,
				/obj/random/voidhelmet = 10,
				/obj/random/voidsuit = 10,
				/obj/item/clothing/mask/muzzle = 7,
				/obj/item/clothing/mask/gas/syndicate = 10,
				/obj/item/clothing/glasses/night = 3,
				/obj/item/clothing/glasses/thermal = 1,
				/obj/item/clothing/glasses/welding/superior = 7,
				/obj/item/clothing/head/collectable/petehat = 4,
				/obj/item/clothing/suit/storage/vest/merc = 3,
				/obj/item/clothing/suit/straight_jacket = 6,
				/obj/item/clothing/head/helmet/merc = 3,
				/obj/item/stack/material/diamond/ten = 7,
				/obj/item/stack/material/glass/phoronrglass/ten = 7,
				/obj/item/stack/material/marble/ten = 8,
				/obj/item/stack/material/phoron/ten = 7,
				/obj/item/stack/material/gold/ten = 7,
				/obj/item/stack/material/silver/ten = 7,
				/obj/item/stack/material/osmium/ten = 7,
				/obj/item/stack/material/platinum/ten = 8,
				/obj/item/stack/material/tritium/ten = 7,
				/obj/item/stack/material/mhydrogen/ten = 6,
				/obj/item/stack/material/plasteel/ten = 9,
				/obj/item/storage/box/monkeycubes = 5,
				/obj/item/storage/box/monkeycubes/neaeracubes = 4,
				/obj/item/storage/box/monkeycubes/stokcubes = 4,
				/obj/item/storage/box/monkeycubes/farwacubes = 4,
				/obj/item/storage/firstaid/surgery = 4,
				/obj/item/cell/infinite = 1,
				/obj/item/archaeological_find = 2,
				/obj/machinery/artifact = 1,
				/obj/item/device/multitool/hacktool = 2,
				/obj/item/surgicaldrill = 7,
				/obj/item/FixOVein = 7,
				/obj/item/retractor = 7,
				/obj/item/hemostat = 7,
				/obj/item/cautery = 7,
				/obj/item/bonesetter = 7,
				/obj/item/bonegel = 7,
				/obj/item/circular_saw = 7,
				/obj/item/scalpel = 7,
				/obj/item/melee/baton/loaded = 9,
				/obj/item/device/radio/headset/syndicate = 6)

/obj/random/voidhelmet
	name = "Random Voidsuit Helmet"
	desc = "This is a random voidsuit helmet."
	icon = 'icons/obj/clothing/hats.dmi'
	icon_state = "void"

/obj/random/voidhelmet/spawn_choices()
	return list(/obj/item/clothing/head/helmet/space/void,
				/obj/item/clothing/head/helmet/space/void/engineering,
				/obj/item/clothing/head/helmet/space/void/engineering/alt,
				/obj/item/clothing/head/helmet/space/void/engineering/salvage,
				/obj/item/clothing/head/helmet/space/void/mining,
				/obj/item/clothing/head/helmet/space/void/mining/alt,
				/obj/item/clothing/head/helmet/space/void/security,
				/obj/item/clothing/head/helmet/space/void/security/alt,
				/obj/item/clothing/head/helmet/space/void/atmos,
				/obj/item/clothing/head/helmet/space/void/atmos/alt,
				/obj/item/clothing/head/helmet/space/void/merc,
				/obj/item/clothing/head/helmet/space/void/medical,
				/obj/item/clothing/head/helmet/space/void/medical/alt)

/obj/random/voidsuit
	name = "Random Voidsuit"
	desc = "This is a random voidsuit."
	icon = 'icons/obj/clothing/suits.dmi'
	icon_state = "void"

/obj/random/voidsuit/spawn_choices()
	return list(/obj/item/clothing/suit/space/void,
				/obj/item/clothing/suit/space/void/engineering,
				/obj/item/clothing/suit/space/void/engineering/alt,
				/obj/item/clothing/suit/space/void/engineering/salvage,
				/obj/item/clothing/suit/space/void/mining,
				/obj/item/clothing/suit/space/void/mining/alt,
				/obj/item/clothing/suit/space/void/security,
				/obj/item/clothing/suit/space/void/security/alt,
				/obj/item/clothing/suit/space/void/atmos,
				/obj/item/clothing/suit/space/void/atmos/alt,
				/obj/item/clothing/suit/space/void/merc,
				/obj/item/clothing/suit/space/void/medical,
				/obj/item/clothing/suit/space/void/medical/alt)

/obj/random/hostile
	name = "Random Hostile Mob"
	desc = "This is a random hostile mob."
	icon = 'icons/mob/amorph.dmi'
	icon_state = "standing"
	spawn_nothing_percentage = 80

obj/random/hostile/spawn_choices()
	return list(/mob/living/simple_animal/hostile/viscerator,
				/mob/living/simple_animal/hostile/carp,
				/mob/living/simple_animal/hostile/carp/pike,
				/mob/living/simple_animal/hostile/vagrant/swarm)

/obj/random/mob/roaches
	name = "random roach"
	icon_state = "standing"

/obj/random/mob/roaches/spawn_choices()
	return list(/mob/living/simple_animal/hostile/retaliate/roach,\
				/mob/living/simple_animal/hostile/retaliate/roach/tank,\
				/mob/living/simple_animal/hostile/retaliate/roach/hunter,\
				/mob/living/simple_animal/hostile/retaliate/roach/fuhrer)

/obj/random/mob/roaches/low_chance
	name = "low chance random roach"
	icon_state = "standing"
	spawn_nothing_percentage = 70

/obj/random/mining_hostile
	name = "Random Hostile Mining Mob"

/obj/random/mining_hostile/spawn_choices()
	return list(/mob/living/simple_animal/hostile/mining_borg,\
				/mob/living/simple_animal/hostile/mining_borg/behemoth,\
				/mob/living/simple_animal/hostile/mining_borg/thin,\
				/mob/living/simple_animal/hostile/mining_borg/sleek,\
				/mob/living/simple_animal/hostile/mining_borg/buff, \
				/mob/living/simple_animal/hostile/mining_borg/minesect)



/*
	Selects one spawn point out of a group of points with the same ID and asks it to generate its items
*/
var/list/multi_point_spawns

/obj/random_multi
	name = "random object spawn point"
	desc = "This item type is used to spawn random objects at round-start. Only one spawn point for a given group id is selected."
	icon = 'icons/misc/mark.dmi'
	icon_state = "x3"
	invisibility = INVISIBILITY_MAXIMUM
	var/id     // Group id
	var/weights // Probability weight for this spawn point

/obj/random_multi/Initialize()
	. = ..()
	weights = max(1, round(weights))

	if(!multi_point_spawns)
		multi_point_spawns = list()
	var/list/spawnpoints = multi_point_spawns[id]
	if(!spawnpoints)
		spawnpoints = list()
		multi_point_spawns[id] = spawnpoints
	spawnpoints[src] = weights

/obj/random_multi/Destroy()
	var/list/spawnpoints = multi_point_spawns[id]
	spawnpoints -= src
	if(!spawnpoints.len)
		multi_point_spawns -= id
	. = ..()

/obj/random_multi/proc/generate_items()
	return

/obj/random_multi/single_item
	var/item_path  // Item type to spawn

/obj/random_multi/single_item/generate_items()
	new item_path(loc)

/hook/roundstart/proc/generate_multi_spawn_items()
	for(var/id in multi_point_spawns)
		var/list/spawn_points = multi_point_spawns[id]
		var/obj/random_multi/rm = pickweight(spawn_points)
		rm.generate_items()
		for(var/entry in spawn_points)
			qdel(entry)
	return 1

/obj/random_multi/single_item/captains_spare_id
	name = "Multi Point - Captain's Spare"
	id = "Captain's spare id"
	item_path = /obj/item/card/id/captains_spare

var/list/random_junk_
var/list/random_useful_
/proc/get_random_useful_type()
	if(!random_useful_)
		random_useful_ = list()
		random_useful_ += /obj/item/pen/crayon/random
		random_useful_ += /obj/item/pen
		random_useful_ += /obj/item/pen/blue
		random_useful_ += /obj/item/pen/red
		random_useful_ += /obj/item/pen/multi
		random_useful_ += /obj/item/storage/box/matches
		random_useful_ += /obj/item/stack/material/cardboard
		random_useful_ += /obj/item/storage/fancy/cigarettes
		random_useful_ += /obj/item/deck/cards
	return pick(random_useful_)

/proc/get_random_junk_type()
	if(prob(20)) // Misc. clutter
		return /obj/effect/decal/cleanable/generic

	// 80% chance that we reach here
	if(prob(95)) // Misc. junk
		if(!random_junk_)
			random_junk_ = subtypesof(/obj/item/trash)
			random_junk_ += typesof(/obj/item/cigbutt)
			random_junk_ += /obj/item/remains/mouse
			random_junk_ += /obj/item/remains/robot
			random_junk_ += /obj/item/paper/crumpled
			random_junk_ += /obj/item/inflatable/torn
			random_junk_ += /obj/effect/decal/cleanable/molten_item
			random_junk_ += /obj/item/material/shard
			random_junk_ += /obj/item/hand/missing_card

			random_junk_ -= /obj/item/trash/plate
			random_junk_ -= /obj/item/trash/snack_bowl
			random_junk_ -= /obj/item/trash/syndi_cakes
			random_junk_ -= /obj/item/trash/tray
		return pick(random_junk_)

	// Misc. actually useful stuff or perhaps even food
	// 4% chance that we reach here
	if(prob(75))
		return get_random_useful_type()

	// 1% chance that we reach here
	var/lunches = lunchables_lunches()
	return lunches[pick(lunches)]
