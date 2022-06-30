import Data.List
import System.IO
import System.Environment
import System.Posix.User
import System.Exit

exec str = 
            do
                if str == "mem" 
                then 
                    appendFile "/sys/power/state" "mem"
                else if str == "freeze" 
                then 
                    appendFile "/sys/power/state" "freeze"
                else
                    putStrLn("ERROR: Invalid option passed. Options: freeze or mem")

checkUUID = 
            do
                isRoot <- fmap (== 0) getRealUserID
                if not isRoot
                then
                    die "ERROR: Not running as root!"
                else
                    putStr ""


main :: IO()
main = do
            checkUUID
            args <- getArgs
    
            if length args < 1
            then
                die "ERROR: Too few arguments, please supply mem or freeze"
            else
                exec $ head args
