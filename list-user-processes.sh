#!/bin/bash

ps aux | grep $(printenv USER | cut -c 1-7 )
