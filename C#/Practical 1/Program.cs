using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Threading;

namespace Timer
{
    internal class Program
    {
        static void Main(string[] args)
        {
            bool bContinue = true;

            while (bContinue)
            {

                // Ask the user which type of timer is needed
                Console.Write("Please type 1 for the basic timer, 2 for the advanced timer, and 3 for exit: ");
                string strTimerType = Console.ReadLine();

                // The input is 1
                if (strTimerType == "1")
                {
                    // Get the duration in second
                    Console.Write("Please enter the duration of the timer in seconds: ");
                    string strDuration = Console.ReadLine();

                    // Try to convert the duration into a number, and display an error message if that cannot be done
                    int iDuration;
                    bool bParseSuccessful = int.TryParse(strDuration, out iDuration);
                    if (bParseSuccessful == false)
                        Console.WriteLine("Error! Not a number!");

                    // The duration can be converted into a number
                    else
                    {
                        // Keep counting down until duration < 0 
                        while (iDuration >= 0)
                        {
                            Console.WriteLine(iDuration.ToString());
                            iDuration--;
                            Thread.Sleep(1000);
                        }

                        // Display the final message
                        Console.WriteLine("Time's up!");
                    }
                }

                // The input is 2
                else if (strTimerType == "2")
                {
                    // Get the input duration
                    Console.Write("Please enter the duration of the timer in [minute:second]: ");
                    string strDuration = Console.ReadLine();

                    // Check the position of the colon
                    int iColon = strDuration.IndexOf(":");
                    if (iColon == -1)
                    {
                        Console.WriteLine("Error! Incorrect time format!");
                    }

                    // If colon exists
                    else
                    {
                        // Get the substring of minute and second
                        string strSecond, strMinute;
                        strMinute = strDuration.Substring(0, iColon);
                        strSecond = strDuration.Substring(iColon+1);

                        // Try converting them into integer
                        int iSecond, iMinute;
                        bool bParseSuccessfulSecond, bParseSuccessfulMinute;
                        bParseSuccessfulMinute = int.TryParse(strMinute, out iMinute);
                        bParseSuccessfulSecond = int.TryParse(strSecond, out iSecond);

                        // If there is an error
                        if (!bParseSuccessfulSecond || !bParseSuccessfulMinute)
                        {
                            Console.WriteLine("Error! Incorrect time format!");
                        }

                        // No error - proceed to count down
                        else
                        {
                            // Convert the duration into a total number of seconds
                            int iDuration = iMinute * 60 + iSecond;

                            // Count down
                            while (iDuration >= 0)
                            {
                                // Display the minute and second using / and %
                                Console.Write("\r" + (iDuration/60).ToString() + ":" + (iDuration%60).ToString() + "          ");
                                iDuration--;
                                Thread.Sleep(1000);
                            }
                            
                            // Display the blinking message
                            for (int i = 0; i < 5; i++)
                            {
                                Console.Write("\r              ");
                                Thread.Sleep(500);
                                Console.Write("\rTime's up!    ");
                                Thread.Sleep(500);
                            }
                            Console.WriteLine();
                        }
                    }

                }

                // The input is 3, set the flag to false and the while loop will stop
                else if (strTimerType == "3")
                {
                    bContinue = false;
                }

                // The input is not 1 nor 2 nor 3
                else
                {
                    Console.WriteLine("Incorrect input!");
                }

            }
        }
    }
}
