-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- Generated by Quartus II Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition
-- Created on Thu Nov 28 17:49:10 2024

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY comparador_dir IS
    PORT (
        reset : IN STD_LOGIC := '0';
        clock : IN STD_LOGIC;
        orientacion : IN STD_LOGIC_VECTOR(1 DOWNTO 0) := "00";
        dir_min : IN STD_LOGIC_VECTOR(1 DOWNTO 0) := "00";
        dir_correcta : OUT STD_LOGIC
    );
END comparador_dir;

ARCHITECTURE BEHAVIOR OF comparador_dir IS
    TYPE type_fstate IS (idle,distinto,igual);
    SIGNAL fstate : type_fstate;
    SIGNAL reg_fstate : type_fstate;
BEGIN
    PROCESS (clock,reg_fstate)
    BEGIN
        IF (clock='1' AND clock'event) THEN
            fstate <= reg_fstate;
        END IF;
    END PROCESS;

    PROCESS (fstate,reset,orientacion,dir_min)
    BEGIN
        IF (reset='1') THEN
            reg_fstate <= idle;
            dir_correcta <= '0';
        ELSE
            dir_correcta <= '0';
            CASE fstate IS
                WHEN idle =>
                    IF ((orientacion(1 DOWNTO 0) /= dir_min(1 DOWNTO 0))) THEN
                        reg_fstate <= distinto;
                    ELSIF ((orientacion(1 DOWNTO 0) = dir_min(1 DOWNTO 0))) THEN
                        reg_fstate <= igual;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= idle;
                    END IF;

                    dir_correcta <= '0';
                WHEN distinto =>
                    IF ((orientacion(1 DOWNTO 0) /= dir_min(1 DOWNTO 0))) THEN
                        reg_fstate <= distinto;
                    ELSIF ((orientacion(1 DOWNTO 0) = dir_min(1 DOWNTO 0))) THEN
                        reg_fstate <= igual;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= distinto;
                    END IF;

                    dir_correcta <= '0';
                WHEN igual =>
                    IF ((orientacion(1 DOWNTO 0) = dir_min(1 DOWNTO 0))) THEN
                        reg_fstate <= igual;
                    ELSIF ((orientacion(1 DOWNTO 0) /= dir_min(1 DOWNTO 0))) THEN
                        reg_fstate <= distinto;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= igual;
                    END IF;

                    dir_correcta <= '1';
                WHEN OTHERS => 
                    dir_correcta <= 'X';
                    report "Reach undefined state";
            END CASE;
        END IF;
    END PROCESS;
END BEHAVIOR;
