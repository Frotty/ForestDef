//===========================================================================
// 
// Forest Defense 0.19c
// 
//   Warcraft III map script
//   Generated by the Warcraft III World Editor
//   Date: Fri Mar 23 00:41:08 2018
//   Map Author: Frotty & kari0003
// 
//===========================================================================

//***************************************************************************
//*
//*  Global Variables
//*
//***************************************************************************

globals
    // User-defined
    rect array              udg_hss_HeroSection
    rect array              udg_hss_HeroCreation
    unit array              udg_hss_Heroes
    group                   udg_hss_AvailableHeroes    = null
    group                   udg_hss_SelectableHeroes   = null
    trigger                 udg_hss_CreatedHeroTrigger = null
    location                udg_tloc                   = null
    force                   udg_tforce                 = null

    // Generated
    rect                    gg_rct_smallBot            = null
    rect                    gg_rct_smallTop            = null
    rect                    gg_rct_smallLeft           = null
    rect                    gg_rct_smallRight          = null
    rect                    gg_rct_bigLeftBot          = null
    rect                    gg_rct_bigLeftTop          = null
    rect                    gg_rct_bigTopLeft          = null
    rect                    gg_rct_bigTopRight         = null
    rect                    gg_rct_bigRightTop         = null
    rect                    gg_rct_bigRightBot         = null
    rect                    gg_rct_bigBotRight         = null
    rect                    gg_rct_bigBotLeft          = null
    sound                   gg_snd_PigWhat2            = null
    sound                   gg_snd_CrabDeath1          = null
    sound                   gg_snd_H01Uther03          = null
    sound                   gg_snd_BuildingPlacement   = null
    sound                   gg_snd_SkeletonWhat2       = null
    sound                   gg_snd_AbominationPissed5  = null
    sound                   gg_snd_DuneWormDeath1      = null
    sound                   gg_snd_HydraDeath1         = null
    sound                   gg_snd_AirBargeDeath1      = null
    sound                   gg_snd_HumanCallToArmsWhat1 = null
    sound                   gg_snd_GenericWarningUnitAttack1 = null
    sound                   gg_snd_PeonYesAttack1      = null
    sound                   gg_snd_OgrePissed5         = null
    trigger                 gg_trg_Untitled_Trigger_001 = null
    trigger                 gg_trg_Untitled_Trigger_010 = null
    trigger                 gg_trg_Untitled_Trigger_009 = null
    trigger                 gg_trg_Untitled_Trigger_008 = null
    trigger                 gg_trg_Untitled_Trigger_006 = null
    trigger                 gg_trg_Untitled_Trigger_005 = null
    trigger                 gg_trg_Untitled_Trigger_003 = null
    trigger                 gg_trg_Untitled_Trigger_002 = null
    trigger                 gg_trg_Untitled_Trigger_004 = null
    trigger                 gg_trg_Untitled_Trigger_007 = null
    unit                    gg_unit_h00E_0008          = null
    unit                    gg_unit_h00E_0007          = null
endglobals

function InitGlobals takes nothing returns nothing
    local integer i = 0
    set udg_hss_AvailableHeroes = CreateGroup()
    set udg_hss_SelectableHeroes = CreateGroup()
    set udg_tforce = CreateForce()
endfunction

//***************************************************************************
//*
//*  Sounds
//*
//***************************************************************************

function InitSounds takes nothing returns nothing
    set gg_snd_PigWhat2 = CreateSound( "Units\\Critters\\Pig\\PigWhat2.wav", false, false, true, 10, 10, "DefaultEAXON" )
    call SetSoundParamsFromLabel( gg_snd_PigWhat2, "PigWhat" )
    call SetSoundChannel( gg_snd_PigWhat2, 0 )
    set gg_snd_CrabDeath1 = CreateSound( "Units\\Critters\\SpiderCrab\\CrabDeath1.wav", false, false, true, 10, 10, "DefaultEAXON" )
    call SetSoundParamsFromLabel( gg_snd_CrabDeath1, "SpiderCrabDeath" )
    call SetSoundChannel( gg_snd_CrabDeath1, 0 )
    set gg_snd_H01Uther03 = CreateSound( "Sound\\Dialogue\\HumanCampaign\\Human01\\H01Uther03.mp3", false, false, false, 10, 10, "DefaultEAXON" )
    call SetSoundParamsFromLabel( gg_snd_H01Uther03, "H01Uther03" )
    call SetSoundPitch( gg_snd_H01Uther03, 1.6 )
    set gg_snd_BuildingPlacement = CreateSound( "Sound\\Buildings\\Shared\\BuildingPlacement.wav", false, false, false, 10, 10, "DefaultEAXON" )
    call SetSoundParamsFromLabel( gg_snd_BuildingPlacement, "PlaceBuildingDefault" )
    set gg_snd_SkeletonWhat2 = CreateSound( "Units\\Undead\\Skeleton\\SkeletonWhat2.wav", false, false, true, 10, 10, "DefaultEAXON" )
    call SetSoundParamsFromLabel( gg_snd_SkeletonWhat2, "SkeletonWhat" )
    set gg_snd_AbominationPissed5 = CreateSound( "Units\\Undead\\Abomination\\AbominationPissed5.wav", false, false, true, 10, 10, "DefaultEAXON" )
    call SetSoundParamsFromLabel( gg_snd_AbominationPissed5, "AbominationPissed" )
    set gg_snd_DuneWormDeath1 = CreateSound( "Units\\Critters\\DuneWorm\\DuneWormDeath1.wav", false, false, true, 10, 10, "DefaultEAXON" )
    call SetSoundParamsFromLabel( gg_snd_DuneWormDeath1, "DuneWormDeath" )
    set gg_snd_HydraDeath1 = CreateSound( "Units\\Creeps\\Hydra\\HydraDeath1.wav", false, true, true, 10, 10, "DefaultEAXON" )
    call SetSoundParamsFromLabel( gg_snd_HydraDeath1, "HydraDeath" )
    set gg_snd_AirBargeDeath1 = CreateSound( "Units\\Undead\\UndeadAirBarge\\AirBargeDeath1.wav", false, true, true, 10, 10, "DefaultEAXON" )
    call SetSoundParamsFromLabel( gg_snd_AirBargeDeath1, "UndeadAirBargeDeath" )
    set gg_snd_HumanCallToArmsWhat1 = CreateSound( "Abilities\\Spells\\Human\\CallToArms\\HumanCallToArmsWhat1.wav", false, true, true, 10, 10, "SpellsEAX" )
    call SetSoundParamsFromLabel( gg_snd_HumanCallToArmsWhat1, "TownHallCallToArms" )
    set gg_snd_GenericWarningUnitAttack1 = CreateSound( "Sound\\Dialogue\\GenericWarnings\\GenericWarningUnitAttack1.mp3", false, false, false, 10, 10, "" )
    call SetSoundParamsFromLabel( gg_snd_GenericWarningUnitAttack1, "UnderAttackGeneric" )
    set gg_snd_PeonYesAttack1 = CreateSound( "Units\\Orc\\Peon\\PeonYesAttack1.wav", false, true, true, 10, 10, "DefaultEAXON" )
    call SetSoundParamsFromLabel( gg_snd_PeonYesAttack1, "PeonYesAttack" )
    set gg_snd_OgrePissed5 = CreateSound( "Units\\Creeps\\Ogre\\OgrePissed5.wav", false, true, true, 10, 10, "DefaultEAXON" )
    call SetSoundParamsFromLabel( gg_snd_OgrePissed5, "OgrePissed" )
endfunction

//***************************************************************************
//*
//*  Unit Creation
//*
//***************************************************************************

//===========================================================================
function CreateBuildingsForPlayer8 takes nothing returns nothing
    local player p = Player(8)
    local unit u
    local integer unitID
    local trigger t
    local real life

    set gg_unit_h00E_0007 = CreateUnit( p, 'h00E', 11776.0, -512.0, 270.000 )
    set gg_unit_h00E_0008 = CreateUnit( p, 'h00E', 2176.0, 1664.0, 270.000 )
endfunction

//===========================================================================
function CreateUnitsForPlayer8 takes nothing returns nothing
    local player p = Player(8)
    local unit u
    local integer unitID
    local trigger t
    local real life

    set u = CreateUnit( p, 'h00D', 1572.2, 1225.6, 75.625 )
    set u = CreateUnit( p, 'h00D', 2692.4, 1074.6, 167.672 )
    set u = CreateUnit( p, 'h00D', 2791.5, 2055.3, 245.154 )
    set u = CreateUnit( p, 'h00D', 1944.9, 2346.8, 317.448 )
    set u = CreateUnit( p, 'h00D', 11015.8, 344.7, 338.577 )
    set u = CreateUnit( p, 'h00D', 10816.3, -1406.8, 292.862 )
    set u = CreateUnit( p, 'h00D', 12896.9, -1328.8, 262.199 )
    set u = CreateUnit( p, 'h00D', 12725.4, 417.5, 140.251 )
    set u = CreateUnit( p, 'h00D', 12771.2, -1218.1, 85.048 )
    set u = CreateUnit( p, 'h00D', 10913.2, -1260.8, 12.948 )
    set u = CreateUnit( p, 'h00D', 12665.1, 285.3, 259.360 )
    set u = CreateUnit( p, 'h00D', 10982.0, 536.8, 144.404 )
endfunction

//===========================================================================
function CreateNeutralPassive takes nothing returns nothing
    local player p = Player(PLAYER_NEUTRAL_PASSIVE)
    local unit u
    local integer unitID
    local trigger t
    local real life

    set u = CreateUnit( p, 'u013', -260.6, -191.0, 273.410 )
endfunction

//===========================================================================
function CreatePlayerBuildings takes nothing returns nothing
    call CreateBuildingsForPlayer8(  )
endfunction

//===========================================================================
function CreatePlayerUnits takes nothing returns nothing
    call CreateUnitsForPlayer8(  )
endfunction

//===========================================================================
function CreateAllUnits takes nothing returns nothing
    call CreatePlayerBuildings(  )
    call CreateNeutralPassive(  )
    call CreatePlayerUnits(  )
endfunction

//***************************************************************************
//*
//*  Regions
//*
//***************************************************************************

function CreateRegions takes nothing returns nothing
    local weathereffect we

    set gg_rct_smallBot = Rect( 1120.0, -864.0, 3264.0, -768.0 )
    set gg_rct_smallTop = Rect( 1344.0, 4032.0, 3488.0, 4128.0 )
    set gg_rct_smallLeft = Rect( -384.0, 1088.0, -288.0, 2848.0 )
    set gg_rct_smallRight = Rect( 4576.0, 800.0, 4672.0, 2560.0 )
    set gg_rct_bigLeftBot = Rect( 6848.0, -3040.0, 6944.0, -1568.0 )
    set gg_rct_bigLeftTop = Rect( 6848.0, 1280.0, 6944.0, 3008.0 )
    set gg_rct_bigTopLeft = Rect( 8800.0, 4192.0, 10208.0, 4320.0 )
    set gg_rct_bigTopRight = Rect( 13344.0, 4192.0, 14816.0, 4320.0 )
    set gg_rct_bigRightTop = Rect( 16608.0, 512.0, 16736.0, 1984.0 )
    set gg_rct_bigRightBot = Rect( 16672.0, -3072.0, 16800.0, -1568.0 )
    set gg_rct_bigBotRight = Rect( 13408.0, -5280.0, 14752.0, -5152.0 )
    set gg_rct_bigBotLeft = Rect( 8736.0, -5280.0, 10144.0, -5152.0 )
endfunction

//***************************************************************************
//*
//*  Custom Script Code
//*
//***************************************************************************
//TESH.scrollpos=0
//TESH.alwaysfold=0

//***************************************************************************
//*
//*  Triggers
//*
//***************************************************************************

//===========================================================================
// Trigger: Untitled Trigger 001
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_Untitled_Trigger_001_Actions takes nothing returns nothing
    call AddSpecialEffectLocBJ( GetRectCenter(GetPlayableMapRect()), "Abilities\\Weapons\\IllidanMissile\\IllidanMissile.mdl" )
    call KillUnit( gg_unit_h00E_0008 )
    call KillUnit( gg_unit_h00E_0007 )
endfunction

//===========================================================================
function InitTrig_Untitled_Trigger_001 takes nothing returns nothing
    set gg_trg_Untitled_Trigger_001 = CreateTrigger(  )
    call TriggerAddAction( gg_trg_Untitled_Trigger_001, function Trig_Untitled_Trigger_001_Actions )
endfunction

//===========================================================================
// Trigger: Untitled Trigger 010
//===========================================================================
function Trig_Untitled_Trigger_010_Actions takes nothing returns nothing
    call AddSpecialEffectLocBJ( GetRectCenter(GetPlayableMapRect()), "UI\\Feedback\\GoldCredit\\GoldCredit.mdl" )
endfunction

//===========================================================================
function InitTrig_Untitled_Trigger_010 takes nothing returns nothing
    set gg_trg_Untitled_Trigger_010 = CreateTrigger(  )
    call TriggerAddAction( gg_trg_Untitled_Trigger_010, function Trig_Untitled_Trigger_010_Actions )
endfunction

//===========================================================================
// Trigger: Untitled Trigger 009
//===========================================================================
function Trig_Untitled_Trigger_009_Actions takes nothing returns nothing
    call AddLightningLoc( "CLPB", GetUnitLoc(GetTriggerUnit()), GetRectCenter(GetPlayableMapRect()) )
endfunction

//===========================================================================
function InitTrig_Untitled_Trigger_009 takes nothing returns nothing
    set gg_trg_Untitled_Trigger_009 = CreateTrigger(  )
    call TriggerAddAction( gg_trg_Untitled_Trigger_009, function Trig_Untitled_Trigger_009_Actions )
endfunction

//===========================================================================
// Trigger: Untitled Trigger 008
//===========================================================================
function Trig_Untitled_Trigger_008_Actions takes nothing returns nothing
    call UnitApplyTimedLifeBJ( 60, 'BTLF', GetTriggerUnit() )
endfunction

//===========================================================================
function InitTrig_Untitled_Trigger_008 takes nothing returns nothing
    set gg_trg_Untitled_Trigger_008 = CreateTrigger(  )
    call TriggerAddAction( gg_trg_Untitled_Trigger_008, function Trig_Untitled_Trigger_008_Actions )
endfunction

//===========================================================================
// Trigger: Untitled Trigger 006
//===========================================================================
function Trig_Untitled_Trigger_006_Actions takes nothing returns nothing
    call AddSpecialEffectLocBJ( GetRectCenter(GetPlayableMapRect()), "Abilities\\Weapons\\LordofFlameMissile\\LordofFlameMissile.mdl" )
endfunction

//===========================================================================
function InitTrig_Untitled_Trigger_006 takes nothing returns nothing
    set gg_trg_Untitled_Trigger_006 = CreateTrigger(  )
    call TriggerAddAction( gg_trg_Untitled_Trigger_006, function Trig_Untitled_Trigger_006_Actions )
endfunction

//===========================================================================
// Trigger: Untitled Trigger 005
//===========================================================================
function Trig_Untitled_Trigger_005_Actions takes nothing returns nothing
    call AddSpecialEffectLocBJ( GetRectCenter(GetPlayableMapRect()), "Abilities\\Weapons\\DragonHawkMissile\\DragonHawkMissile.mdl" )
    call AddSpecialEffectLocBJ( GetRectCenter(GetPlayableMapRect()), "Abilities\\Weapons\\DruidoftheTalonMissile\\DruidoftheTalonMissile.mdl" )
endfunction

//===========================================================================
function InitTrig_Untitled_Trigger_005 takes nothing returns nothing
    set gg_trg_Untitled_Trigger_005 = CreateTrigger(  )
    call TriggerAddAction( gg_trg_Untitled_Trigger_005, function Trig_Untitled_Trigger_005_Actions )
endfunction

//===========================================================================
// Trigger: Untitled Trigger 003
//===========================================================================
function Trig_Untitled_Trigger_003_Actions takes nothing returns nothing
    call AddSpecialEffectLocBJ( GetRectCenter(GetPlayableMapRect()), "Abilities\\Weapons\\PhoenixMissile\\Phoenix_Missile.mdl" )
endfunction

//===========================================================================
function InitTrig_Untitled_Trigger_003 takes nothing returns nothing
    set gg_trg_Untitled_Trigger_003 = CreateTrigger(  )
    call TriggerAddAction( gg_trg_Untitled_Trigger_003, function Trig_Untitled_Trigger_003_Actions )
endfunction

//===========================================================================
// Trigger: Untitled Trigger 002
//===========================================================================
function Trig_Untitled_Trigger_002_Actions takes nothing returns nothing
    call AddSpecialEffectLocBJ( GetRectCenter(GetPlayableMapRect()), "Units\\Undead\\Abomination\\AbominationExplosion.mdl" )
endfunction

//===========================================================================
function InitTrig_Untitled_Trigger_002 takes nothing returns nothing
    set gg_trg_Untitled_Trigger_002 = CreateTrigger(  )
    call TriggerAddAction( gg_trg_Untitled_Trigger_002, function Trig_Untitled_Trigger_002_Actions )
endfunction

//===========================================================================
// Trigger: Untitled Trigger 004
//===========================================================================
function Trig_Untitled_Trigger_004_Actions takes nothing returns nothing
    call AddSpecialEffectLocBJ( GetRectCenter(GetPlayableMapRect()), "Abilities\\Weapons\\GuardTowerMissile\\GuardTowerMissile.mdl" )
endfunction

//===========================================================================
function InitTrig_Untitled_Trigger_004 takes nothing returns nothing
    set gg_trg_Untitled_Trigger_004 = CreateTrigger(  )
    call TriggerAddAction( gg_trg_Untitled_Trigger_004, function Trig_Untitled_Trigger_004_Actions )
endfunction

//===========================================================================
// Trigger: Untitled Trigger 007
//===========================================================================
function Trig_Untitled_Trigger_007_Actions takes nothing returns nothing
    call AddSpecialEffectLocBJ( GetRectCenter(GetPlayableMapRect()), "Abilities\\Spells\\NightElf\\BattleRoar\\RoarCaster.mdl" )
endfunction

//===========================================================================
function InitTrig_Untitled_Trigger_007 takes nothing returns nothing
    set gg_trg_Untitled_Trigger_007 = CreateTrigger(  )
    call TriggerAddAction( gg_trg_Untitled_Trigger_007, function Trig_Untitled_Trigger_007_Actions )
endfunction

//===========================================================================
function InitCustomTriggers takes nothing returns nothing
    call InitTrig_Untitled_Trigger_001(  )
    call InitTrig_Untitled_Trigger_010(  )
    call InitTrig_Untitled_Trigger_009(  )
    call InitTrig_Untitled_Trigger_008(  )
    call InitTrig_Untitled_Trigger_006(  )
    call InitTrig_Untitled_Trigger_005(  )
    call InitTrig_Untitled_Trigger_003(  )
    call InitTrig_Untitled_Trigger_002(  )
    call InitTrig_Untitled_Trigger_004(  )
    call InitTrig_Untitled_Trigger_007(  )
endfunction

//***************************************************************************
//*
//*  Players
//*
//***************************************************************************

function InitCustomPlayerSlots takes nothing returns nothing

    // Player 0
    call SetPlayerStartLocation( Player(0), 0 )
    call ForcePlayerStartLocation( Player(0), 0 )
    call SetPlayerColor( Player(0), ConvertPlayerColor(0) )
    call SetPlayerRacePreference( Player(0), RACE_PREF_HUMAN )
    call SetPlayerRaceSelectable( Player(0), false )
    call SetPlayerController( Player(0), MAP_CONTROL_USER )

    // Player 1
    call SetPlayerStartLocation( Player(1), 1 )
    call ForcePlayerStartLocation( Player(1), 1 )
    call SetPlayerColor( Player(1), ConvertPlayerColor(1) )
    call SetPlayerRacePreference( Player(1), RACE_PREF_HUMAN )
    call SetPlayerRaceSelectable( Player(1), false )
    call SetPlayerController( Player(1), MAP_CONTROL_USER )

    // Player 2
    call SetPlayerStartLocation( Player(2), 2 )
    call ForcePlayerStartLocation( Player(2), 2 )
    call SetPlayerColor( Player(2), ConvertPlayerColor(2) )
    call SetPlayerRacePreference( Player(2), RACE_PREF_HUMAN )
    call SetPlayerRaceSelectable( Player(2), false )
    call SetPlayerController( Player(2), MAP_CONTROL_USER )

    // Player 3
    call SetPlayerStartLocation( Player(3), 3 )
    call ForcePlayerStartLocation( Player(3), 3 )
    call SetPlayerColor( Player(3), ConvertPlayerColor(3) )
    call SetPlayerRacePreference( Player(3), RACE_PREF_HUMAN )
    call SetPlayerRaceSelectable( Player(3), false )
    call SetPlayerController( Player(3), MAP_CONTROL_USER )

    // Player 4
    call SetPlayerStartLocation( Player(4), 4 )
    call ForcePlayerStartLocation( Player(4), 4 )
    call SetPlayerColor( Player(4), ConvertPlayerColor(4) )
    call SetPlayerRacePreference( Player(4), RACE_PREF_HUMAN )
    call SetPlayerRaceSelectable( Player(4), false )
    call SetPlayerController( Player(4), MAP_CONTROL_USER )

    // Player 5
    call SetPlayerStartLocation( Player(5), 5 )
    call ForcePlayerStartLocation( Player(5), 5 )
    call SetPlayerColor( Player(5), ConvertPlayerColor(5) )
    call SetPlayerRacePreference( Player(5), RACE_PREF_HUMAN )
    call SetPlayerRaceSelectable( Player(5), false )
    call SetPlayerController( Player(5), MAP_CONTROL_USER )

    // Player 6
    call SetPlayerStartLocation( Player(6), 6 )
    call ForcePlayerStartLocation( Player(6), 6 )
    call SetPlayerColor( Player(6), ConvertPlayerColor(6) )
    call SetPlayerRacePreference( Player(6), RACE_PREF_HUMAN )
    call SetPlayerRaceSelectable( Player(6), false )
    call SetPlayerController( Player(6), MAP_CONTROL_USER )

    // Player 7
    call SetPlayerStartLocation( Player(7), 7 )
    call ForcePlayerStartLocation( Player(7), 7 )
    call SetPlayerColor( Player(7), ConvertPlayerColor(7) )
    call SetPlayerRacePreference( Player(7), RACE_PREF_HUMAN )
    call SetPlayerRaceSelectable( Player(7), false )
    call SetPlayerController( Player(7), MAP_CONTROL_USER )

    // Player 8
    call SetPlayerStartLocation( Player(8), 8 )
    call ForcePlayerStartLocation( Player(8), 8 )
    call SetPlayerColor( Player(8), ConvertPlayerColor(8) )
    call SetPlayerRacePreference( Player(8), RACE_PREF_HUMAN )
    call SetPlayerRaceSelectable( Player(8), false )
    call SetPlayerController( Player(8), MAP_CONTROL_COMPUTER )

    // Player 9
    call SetPlayerStartLocation( Player(9), 9 )
    call ForcePlayerStartLocation( Player(9), 9 )
    call SetPlayerColor( Player(9), ConvertPlayerColor(9) )
    call SetPlayerRacePreference( Player(9), RACE_PREF_UNDEAD )
    call SetPlayerRaceSelectable( Player(9), false )
    call SetPlayerController( Player(9), MAP_CONTROL_COMPUTER )

endfunction

function InitCustomTeams takes nothing returns nothing
    // Force: TRIGSTR_580
    call SetPlayerTeam( Player(0), 0 )
    call SetPlayerState( Player(0), PLAYER_STATE_ALLIED_VICTORY, 1 )
    call SetPlayerTeam( Player(1), 0 )
    call SetPlayerState( Player(1), PLAYER_STATE_ALLIED_VICTORY, 1 )
    call SetPlayerTeam( Player(2), 0 )
    call SetPlayerState( Player(2), PLAYER_STATE_ALLIED_VICTORY, 1 )
    call SetPlayerTeam( Player(3), 0 )
    call SetPlayerState( Player(3), PLAYER_STATE_ALLIED_VICTORY, 1 )
    call SetPlayerTeam( Player(4), 0 )
    call SetPlayerState( Player(4), PLAYER_STATE_ALLIED_VICTORY, 1 )
    call SetPlayerTeam( Player(5), 0 )
    call SetPlayerState( Player(5), PLAYER_STATE_ALLIED_VICTORY, 1 )
    call SetPlayerTeam( Player(6), 0 )
    call SetPlayerState( Player(6), PLAYER_STATE_ALLIED_VICTORY, 1 )
    call SetPlayerTeam( Player(7), 0 )
    call SetPlayerState( Player(7), PLAYER_STATE_ALLIED_VICTORY, 1 )
    call SetPlayerTeam( Player(8), 0 )
    call SetPlayerState( Player(8), PLAYER_STATE_ALLIED_VICTORY, 1 )

    //   Allied
    call SetPlayerAllianceStateAllyBJ( Player(0), Player(1), true )
    call SetPlayerAllianceStateAllyBJ( Player(0), Player(2), true )
    call SetPlayerAllianceStateAllyBJ( Player(0), Player(3), true )
    call SetPlayerAllianceStateAllyBJ( Player(0), Player(4), true )
    call SetPlayerAllianceStateAllyBJ( Player(0), Player(5), true )
    call SetPlayerAllianceStateAllyBJ( Player(0), Player(6), true )
    call SetPlayerAllianceStateAllyBJ( Player(0), Player(7), true )
    call SetPlayerAllianceStateAllyBJ( Player(0), Player(8), true )
    call SetPlayerAllianceStateAllyBJ( Player(1), Player(0), true )
    call SetPlayerAllianceStateAllyBJ( Player(1), Player(2), true )
    call SetPlayerAllianceStateAllyBJ( Player(1), Player(3), true )
    call SetPlayerAllianceStateAllyBJ( Player(1), Player(4), true )
    call SetPlayerAllianceStateAllyBJ( Player(1), Player(5), true )
    call SetPlayerAllianceStateAllyBJ( Player(1), Player(6), true )
    call SetPlayerAllianceStateAllyBJ( Player(1), Player(7), true )
    call SetPlayerAllianceStateAllyBJ( Player(1), Player(8), true )
    call SetPlayerAllianceStateAllyBJ( Player(2), Player(0), true )
    call SetPlayerAllianceStateAllyBJ( Player(2), Player(1), true )
    call SetPlayerAllianceStateAllyBJ( Player(2), Player(3), true )
    call SetPlayerAllianceStateAllyBJ( Player(2), Player(4), true )
    call SetPlayerAllianceStateAllyBJ( Player(2), Player(5), true )
    call SetPlayerAllianceStateAllyBJ( Player(2), Player(6), true )
    call SetPlayerAllianceStateAllyBJ( Player(2), Player(7), true )
    call SetPlayerAllianceStateAllyBJ( Player(2), Player(8), true )
    call SetPlayerAllianceStateAllyBJ( Player(3), Player(0), true )
    call SetPlayerAllianceStateAllyBJ( Player(3), Player(1), true )
    call SetPlayerAllianceStateAllyBJ( Player(3), Player(2), true )
    call SetPlayerAllianceStateAllyBJ( Player(3), Player(4), true )
    call SetPlayerAllianceStateAllyBJ( Player(3), Player(5), true )
    call SetPlayerAllianceStateAllyBJ( Player(3), Player(6), true )
    call SetPlayerAllianceStateAllyBJ( Player(3), Player(7), true )
    call SetPlayerAllianceStateAllyBJ( Player(3), Player(8), true )
    call SetPlayerAllianceStateAllyBJ( Player(4), Player(0), true )
    call SetPlayerAllianceStateAllyBJ( Player(4), Player(1), true )
    call SetPlayerAllianceStateAllyBJ( Player(4), Player(2), true )
    call SetPlayerAllianceStateAllyBJ( Player(4), Player(3), true )
    call SetPlayerAllianceStateAllyBJ( Player(4), Player(5), true )
    call SetPlayerAllianceStateAllyBJ( Player(4), Player(6), true )
    call SetPlayerAllianceStateAllyBJ( Player(4), Player(7), true )
    call SetPlayerAllianceStateAllyBJ( Player(4), Player(8), true )
    call SetPlayerAllianceStateAllyBJ( Player(5), Player(0), true )
    call SetPlayerAllianceStateAllyBJ( Player(5), Player(1), true )
    call SetPlayerAllianceStateAllyBJ( Player(5), Player(2), true )
    call SetPlayerAllianceStateAllyBJ( Player(5), Player(3), true )
    call SetPlayerAllianceStateAllyBJ( Player(5), Player(4), true )
    call SetPlayerAllianceStateAllyBJ( Player(5), Player(6), true )
    call SetPlayerAllianceStateAllyBJ( Player(5), Player(7), true )
    call SetPlayerAllianceStateAllyBJ( Player(5), Player(8), true )
    call SetPlayerAllianceStateAllyBJ( Player(6), Player(0), true )
    call SetPlayerAllianceStateAllyBJ( Player(6), Player(1), true )
    call SetPlayerAllianceStateAllyBJ( Player(6), Player(2), true )
    call SetPlayerAllianceStateAllyBJ( Player(6), Player(3), true )
    call SetPlayerAllianceStateAllyBJ( Player(6), Player(4), true )
    call SetPlayerAllianceStateAllyBJ( Player(6), Player(5), true )
    call SetPlayerAllianceStateAllyBJ( Player(6), Player(7), true )
    call SetPlayerAllianceStateAllyBJ( Player(6), Player(8), true )
    call SetPlayerAllianceStateAllyBJ( Player(7), Player(0), true )
    call SetPlayerAllianceStateAllyBJ( Player(7), Player(1), true )
    call SetPlayerAllianceStateAllyBJ( Player(7), Player(2), true )
    call SetPlayerAllianceStateAllyBJ( Player(7), Player(3), true )
    call SetPlayerAllianceStateAllyBJ( Player(7), Player(4), true )
    call SetPlayerAllianceStateAllyBJ( Player(7), Player(5), true )
    call SetPlayerAllianceStateAllyBJ( Player(7), Player(6), true )
    call SetPlayerAllianceStateAllyBJ( Player(7), Player(8), true )
    call SetPlayerAllianceStateAllyBJ( Player(8), Player(0), true )
    call SetPlayerAllianceStateAllyBJ( Player(8), Player(1), true )
    call SetPlayerAllianceStateAllyBJ( Player(8), Player(2), true )
    call SetPlayerAllianceStateAllyBJ( Player(8), Player(3), true )
    call SetPlayerAllianceStateAllyBJ( Player(8), Player(4), true )
    call SetPlayerAllianceStateAllyBJ( Player(8), Player(5), true )
    call SetPlayerAllianceStateAllyBJ( Player(8), Player(6), true )
    call SetPlayerAllianceStateAllyBJ( Player(8), Player(7), true )

    //   Shared Vision
    call SetPlayerAllianceStateVisionBJ( Player(0), Player(1), true )
    call SetPlayerAllianceStateVisionBJ( Player(0), Player(2), true )
    call SetPlayerAllianceStateVisionBJ( Player(0), Player(3), true )
    call SetPlayerAllianceStateVisionBJ( Player(0), Player(4), true )
    call SetPlayerAllianceStateVisionBJ( Player(0), Player(5), true )
    call SetPlayerAllianceStateVisionBJ( Player(0), Player(6), true )
    call SetPlayerAllianceStateVisionBJ( Player(0), Player(7), true )
    call SetPlayerAllianceStateVisionBJ( Player(0), Player(8), true )
    call SetPlayerAllianceStateVisionBJ( Player(1), Player(0), true )
    call SetPlayerAllianceStateVisionBJ( Player(1), Player(2), true )
    call SetPlayerAllianceStateVisionBJ( Player(1), Player(3), true )
    call SetPlayerAllianceStateVisionBJ( Player(1), Player(4), true )
    call SetPlayerAllianceStateVisionBJ( Player(1), Player(5), true )
    call SetPlayerAllianceStateVisionBJ( Player(1), Player(6), true )
    call SetPlayerAllianceStateVisionBJ( Player(1), Player(7), true )
    call SetPlayerAllianceStateVisionBJ( Player(1), Player(8), true )
    call SetPlayerAllianceStateVisionBJ( Player(2), Player(0), true )
    call SetPlayerAllianceStateVisionBJ( Player(2), Player(1), true )
    call SetPlayerAllianceStateVisionBJ( Player(2), Player(3), true )
    call SetPlayerAllianceStateVisionBJ( Player(2), Player(4), true )
    call SetPlayerAllianceStateVisionBJ( Player(2), Player(5), true )
    call SetPlayerAllianceStateVisionBJ( Player(2), Player(6), true )
    call SetPlayerAllianceStateVisionBJ( Player(2), Player(7), true )
    call SetPlayerAllianceStateVisionBJ( Player(2), Player(8), true )
    call SetPlayerAllianceStateVisionBJ( Player(3), Player(0), true )
    call SetPlayerAllianceStateVisionBJ( Player(3), Player(1), true )
    call SetPlayerAllianceStateVisionBJ( Player(3), Player(2), true )
    call SetPlayerAllianceStateVisionBJ( Player(3), Player(4), true )
    call SetPlayerAllianceStateVisionBJ( Player(3), Player(5), true )
    call SetPlayerAllianceStateVisionBJ( Player(3), Player(6), true )
    call SetPlayerAllianceStateVisionBJ( Player(3), Player(7), true )
    call SetPlayerAllianceStateVisionBJ( Player(3), Player(8), true )
    call SetPlayerAllianceStateVisionBJ( Player(4), Player(0), true )
    call SetPlayerAllianceStateVisionBJ( Player(4), Player(1), true )
    call SetPlayerAllianceStateVisionBJ( Player(4), Player(2), true )
    call SetPlayerAllianceStateVisionBJ( Player(4), Player(3), true )
    call SetPlayerAllianceStateVisionBJ( Player(4), Player(5), true )
    call SetPlayerAllianceStateVisionBJ( Player(4), Player(6), true )
    call SetPlayerAllianceStateVisionBJ( Player(4), Player(7), true )
    call SetPlayerAllianceStateVisionBJ( Player(4), Player(8), true )
    call SetPlayerAllianceStateVisionBJ( Player(5), Player(0), true )
    call SetPlayerAllianceStateVisionBJ( Player(5), Player(1), true )
    call SetPlayerAllianceStateVisionBJ( Player(5), Player(2), true )
    call SetPlayerAllianceStateVisionBJ( Player(5), Player(3), true )
    call SetPlayerAllianceStateVisionBJ( Player(5), Player(4), true )
    call SetPlayerAllianceStateVisionBJ( Player(5), Player(6), true )
    call SetPlayerAllianceStateVisionBJ( Player(5), Player(7), true )
    call SetPlayerAllianceStateVisionBJ( Player(5), Player(8), true )
    call SetPlayerAllianceStateVisionBJ( Player(6), Player(0), true )
    call SetPlayerAllianceStateVisionBJ( Player(6), Player(1), true )
    call SetPlayerAllianceStateVisionBJ( Player(6), Player(2), true )
    call SetPlayerAllianceStateVisionBJ( Player(6), Player(3), true )
    call SetPlayerAllianceStateVisionBJ( Player(6), Player(4), true )
    call SetPlayerAllianceStateVisionBJ( Player(6), Player(5), true )
    call SetPlayerAllianceStateVisionBJ( Player(6), Player(7), true )
    call SetPlayerAllianceStateVisionBJ( Player(6), Player(8), true )
    call SetPlayerAllianceStateVisionBJ( Player(7), Player(0), true )
    call SetPlayerAllianceStateVisionBJ( Player(7), Player(1), true )
    call SetPlayerAllianceStateVisionBJ( Player(7), Player(2), true )
    call SetPlayerAllianceStateVisionBJ( Player(7), Player(3), true )
    call SetPlayerAllianceStateVisionBJ( Player(7), Player(4), true )
    call SetPlayerAllianceStateVisionBJ( Player(7), Player(5), true )
    call SetPlayerAllianceStateVisionBJ( Player(7), Player(6), true )
    call SetPlayerAllianceStateVisionBJ( Player(7), Player(8), true )
    call SetPlayerAllianceStateVisionBJ( Player(8), Player(0), true )
    call SetPlayerAllianceStateVisionBJ( Player(8), Player(1), true )
    call SetPlayerAllianceStateVisionBJ( Player(8), Player(2), true )
    call SetPlayerAllianceStateVisionBJ( Player(8), Player(3), true )
    call SetPlayerAllianceStateVisionBJ( Player(8), Player(4), true )
    call SetPlayerAllianceStateVisionBJ( Player(8), Player(5), true )
    call SetPlayerAllianceStateVisionBJ( Player(8), Player(6), true )
    call SetPlayerAllianceStateVisionBJ( Player(8), Player(7), true )

    // Force: TRIGSTR_581
    call SetPlayerTeam( Player(9), 1 )
    call SetPlayerState( Player(9), PLAYER_STATE_ALLIED_VICTORY, 1 )

endfunction

function InitAllyPriorities takes nothing returns nothing

    call SetStartLocPrioCount( 0, 7 )
    call SetStartLocPrio( 0, 0, 1, MAP_LOC_PRIO_HIGH )
    call SetStartLocPrio( 0, 1, 2, MAP_LOC_PRIO_HIGH )
    call SetStartLocPrio( 0, 2, 3, MAP_LOC_PRIO_HIGH )
    call SetStartLocPrio( 0, 3, 4, MAP_LOC_PRIO_HIGH )
    call SetStartLocPrio( 0, 4, 5, MAP_LOC_PRIO_HIGH )
    call SetStartLocPrio( 0, 5, 6, MAP_LOC_PRIO_HIGH )
    call SetStartLocPrio( 0, 6, 7, MAP_LOC_PRIO_HIGH )

    call SetStartLocPrioCount( 1, 7 )
    call SetStartLocPrio( 1, 0, 0, MAP_LOC_PRIO_HIGH )
    call SetStartLocPrio( 1, 1, 2, MAP_LOC_PRIO_HIGH )
    call SetStartLocPrio( 1, 2, 3, MAP_LOC_PRIO_HIGH )
    call SetStartLocPrio( 1, 3, 4, MAP_LOC_PRIO_HIGH )
    call SetStartLocPrio( 1, 4, 5, MAP_LOC_PRIO_HIGH )
    call SetStartLocPrio( 1, 5, 6, MAP_LOC_PRIO_HIGH )
    call SetStartLocPrio( 1, 6, 7, MAP_LOC_PRIO_HIGH )

    call SetStartLocPrioCount( 2, 7 )
    call SetStartLocPrio( 2, 0, 0, MAP_LOC_PRIO_HIGH )
    call SetStartLocPrio( 2, 1, 1, MAP_LOC_PRIO_HIGH )
    call SetStartLocPrio( 2, 2, 3, MAP_LOC_PRIO_HIGH )
    call SetStartLocPrio( 2, 3, 4, MAP_LOC_PRIO_HIGH )
    call SetStartLocPrio( 2, 4, 5, MAP_LOC_PRIO_HIGH )
    call SetStartLocPrio( 2, 5, 6, MAP_LOC_PRIO_HIGH )
    call SetStartLocPrio( 2, 6, 7, MAP_LOC_PRIO_HIGH )

    call SetStartLocPrioCount( 3, 7 )
    call SetStartLocPrio( 3, 0, 0, MAP_LOC_PRIO_HIGH )
    call SetStartLocPrio( 3, 1, 1, MAP_LOC_PRIO_HIGH )
    call SetStartLocPrio( 3, 2, 2, MAP_LOC_PRIO_HIGH )
    call SetStartLocPrio( 3, 3, 4, MAP_LOC_PRIO_HIGH )
    call SetStartLocPrio( 3, 4, 5, MAP_LOC_PRIO_HIGH )
    call SetStartLocPrio( 3, 5, 6, MAP_LOC_PRIO_HIGH )
    call SetStartLocPrio( 3, 6, 7, MAP_LOC_PRIO_HIGH )

    call SetStartLocPrioCount( 4, 7 )
    call SetStartLocPrio( 4, 0, 0, MAP_LOC_PRIO_HIGH )
    call SetStartLocPrio( 4, 1, 1, MAP_LOC_PRIO_HIGH )
    call SetStartLocPrio( 4, 2, 2, MAP_LOC_PRIO_HIGH )
    call SetStartLocPrio( 4, 3, 3, MAP_LOC_PRIO_HIGH )
    call SetStartLocPrio( 4, 4, 5, MAP_LOC_PRIO_HIGH )
    call SetStartLocPrio( 4, 5, 6, MAP_LOC_PRIO_HIGH )
    call SetStartLocPrio( 4, 6, 7, MAP_LOC_PRIO_HIGH )

    call SetStartLocPrioCount( 5, 7 )
    call SetStartLocPrio( 5, 0, 0, MAP_LOC_PRIO_HIGH )
    call SetStartLocPrio( 5, 1, 1, MAP_LOC_PRIO_HIGH )
    call SetStartLocPrio( 5, 2, 2, MAP_LOC_PRIO_HIGH )
    call SetStartLocPrio( 5, 3, 3, MAP_LOC_PRIO_HIGH )
    call SetStartLocPrio( 5, 4, 4, MAP_LOC_PRIO_HIGH )
    call SetStartLocPrio( 5, 5, 6, MAP_LOC_PRIO_HIGH )
    call SetStartLocPrio( 5, 6, 7, MAP_LOC_PRIO_HIGH )

    call SetStartLocPrioCount( 6, 7 )
    call SetStartLocPrio( 6, 0, 0, MAP_LOC_PRIO_HIGH )
    call SetStartLocPrio( 6, 1, 1, MAP_LOC_PRIO_HIGH )
    call SetStartLocPrio( 6, 2, 2, MAP_LOC_PRIO_HIGH )
    call SetStartLocPrio( 6, 3, 3, MAP_LOC_PRIO_HIGH )
    call SetStartLocPrio( 6, 4, 4, MAP_LOC_PRIO_HIGH )
    call SetStartLocPrio( 6, 5, 5, MAP_LOC_PRIO_HIGH )
    call SetStartLocPrio( 6, 6, 7, MAP_LOC_PRIO_HIGH )

    call SetStartLocPrioCount( 7, 7 )
    call SetStartLocPrio( 7, 0, 0, MAP_LOC_PRIO_HIGH )
    call SetStartLocPrio( 7, 1, 1, MAP_LOC_PRIO_HIGH )
    call SetStartLocPrio( 7, 2, 2, MAP_LOC_PRIO_HIGH )
    call SetStartLocPrio( 7, 3, 3, MAP_LOC_PRIO_HIGH )
    call SetStartLocPrio( 7, 4, 4, MAP_LOC_PRIO_HIGH )
    call SetStartLocPrio( 7, 5, 5, MAP_LOC_PRIO_HIGH )
    call SetStartLocPrio( 7, 6, 6, MAP_LOC_PRIO_HIGH )
endfunction

//***************************************************************************
//*
//*  Main Initialization
//*
//***************************************************************************

//===========================================================================
function main takes nothing returns nothing
    local weathereffect we
    call SetCameraBounds( -1280.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), -5632.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM), 17664.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), 5120.0 - GetCameraMargin(CAMERA_MARGIN_TOP), -1280.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), 5120.0 - GetCameraMargin(CAMERA_MARGIN_TOP), 17664.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), -5632.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM) )
    call SetDayNightModels( "Environment\\DNC\\DNCLordaeron\\DNCLordaeronTerrain\\DNCLordaeronTerrain.mdl", "Environment\\DNC\\DNCLordaeron\\DNCLordaeronUnit\\DNCLordaeronUnit.mdl" )
    call SetTerrainFogEx( 0, 600.0, 5000.0, 0.500, 0.078, 0.078, 0.196 )
    call SetWaterBaseColor( 100, 100, 150, 255 )
    set we = AddWeatherEffect( Rect(-2048.0,-6144.0,18432.0,6144.0), 'RAlr' )
    call EnableWeatherEffect( we, true )
    call NewSoundEnvironment( "Default" )
    call SetAmbientDaySound( "VillageDay" )
    call SetAmbientNightSound( "VillageNight" )
    call SetMapMusic( "Music", true, 0 )
    call InitSounds(  )
    call CreateRegions(  )
    call CreateAllUnits(  )
    call InitBlizzard(  )
    call InitGlobals(  )
    call InitCustomTriggers(  )

endfunction

//***************************************************************************
//*
//*  Map Configuration
//*
//***************************************************************************

function config takes nothing returns nothing
    call SetMapName( "TRIGSTR_1675" )
    call SetMapDescription( "TRIGSTR_014" )
    call SetPlayers( 10 )
    call SetTeams( 10 )
    call SetGamePlacement( MAP_PLACEMENT_TEAMS_TOGETHER )

    call DefineStartLocation( 0, 2176.0, 1664.0 )
    call DefineStartLocation( 1, 2176.0, 1664.0 )
    call DefineStartLocation( 2, 2176.0, 1664.0 )
    call DefineStartLocation( 3, 2176.0, 1664.0 )
    call DefineStartLocation( 4, 2176.0, 1664.0 )
    call DefineStartLocation( 5, 2176.0, 1664.0 )
    call DefineStartLocation( 6, 2176.0, 1664.0 )
    call DefineStartLocation( 7, 2176.0, 1664.0 )
    call DefineStartLocation( 8, 2176.0, 1664.0 )
    call DefineStartLocation( 9, 2176.0, 1664.0 )

    // Player setup
    call InitCustomPlayerSlots(  )
    call InitCustomTeams(  )
    call InitAllyPriorities(  )
endfunction

