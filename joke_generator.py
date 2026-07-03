#!/usr/bin/env python3
"""
Random Joke Generator using JokeAPI
Fetches random jokes from an external API and displays them with style.
"""

import requests
import json
from typing import Dict, Optional
from datetime import datetime

# API Configuration
JOKE_API_URL = "https://v2.jokeapi.dev/joke/Any"
HEADERS = {"User-Agent": "JokeGenerator/1.0"}

# Color codes for terminal output
class Colors:
    HEADER = '\033[95m'
    BLUE = '\033[94m'
    CYAN = '\033[96m'
    GREEN = '\033[92m'
    YELLOW = '\033[93m'
    RED = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'


def fetch_joke() -> Optional[Dict]:
    """
    Fetch a random joke from JokeAPI.
    
    Returns:
        Dict containing joke data or None if request fails
    """
    try:
        params = {
            "format": "json",
            "type": "single"
        }
        response = requests.get(JOKE_API_URL, headers=HEADERS, params=params, timeout=5)
        response.raise_for_status()
        return response.json()
    except requests.exceptions.Timeout:
        print(f"{Colors.RED}❌ Error: Request timed out. Please try again.{Colors.ENDC}")
        return None
    except requests.exceptions.ConnectionError:
        print(f"{Colors.RED}❌ Error: Could not connect to API. Check your internet.{Colors.ENDC}")
        return None
    except requests.exceptions.HTTPError as e:
        print(f"{Colors.RED}❌ Error: HTTP {e.response.status_code}{Colors.ENDC}")
        return None
    except Exception as e:
        print(f"{Colors.RED}❌ Error: {str(e)}{Colors.ENDC}")
        return None


def fetch_joke_by_category(category: str) -> Optional[Dict]:
    """
    Fetch a joke from a specific category.
    
    Args:
        category: Joke category (Programming, Knock-knock, General, etc.)
    
    Returns:
        Dict containing joke data or None if request fails
    """
    try:
        url = f"https://v2.jokeapi.dev/joke/{category}"
        params = {"format": "json"}
        response = requests.get(url, headers=HEADERS, params=params, timeout=5)
        response.raise_for_status()
        return response.json()
    except Exception as e:
        print(f"{Colors.RED}❌ Error fetching {category} joke: {str(e)}{Colors.ENDC}")
        return None


def fetch_multiple_jokes(count: int = 5, category: str = "Any") -> list:
    """
    Fetch multiple jokes from API.
    
    Args:
        count: Number of jokes to fetch
        category: Joke category
    
    Returns:
        List of joke dictionaries
    """
    jokes = []
    for i in range(count):
        joke = fetch_joke_by_category(category)
        if joke and joke.get("type") != "error":
            jokes.append(joke)
    return jokes


def display_joke(joke: Dict) -> None:
    """
    Display a joke with nice formatting.
    
    Args:
        joke: Dictionary containing joke data
    """
    if not joke or joke.get("type") == "error":
        print(f"{Colors.RED}❌ No joke found. Try again!{Colors.ENDC}")
        return
    
    print("\n" + "="*60)
    print(f"{Colors.BOLD}{Colors.CYAN}😂 JOKE OF THE MOMENT 😂{Colors.ENDC}")
    print("="*60)
    
    if joke.get("type") == "single":
        # Single joke (usually one-liner)
        print(f"\n{Colors.YELLOW}🎭 {joke.get('joke', 'No joke')}{Colors.ENDC}\n")
    elif joke.get("type") == "twopart":
        # Two-part joke (setup + delivery)
        print(f"\n{Colors.YELLOW}🎭 Setup:{Colors.ENDC} {joke.get('setup', 'No setup')}")
        print(f"{Colors.CYAN}🎯 Delivery:{Colors.ENDC} {joke.get('delivery', 'No delivery')}\n")
    
    # Display joke metadata
    category = joke.get("category", "Unknown")
    safe = joke.get("safe", False)
    flags = joke.get("flags", {})
    
    print(f"{Colors.GREEN}📋 Category: {Colors.BOLD}{category}{Colors.ENDC}")
    print(f"{Colors.GREEN}👨‍👩‍👧‍👦 Family Friendly: {Colors.BOLD}{'✅ Yes' if safe else '❌ No'}{Colors.ENDC}")
    
    if flags:
        print(f"{Colors.GREEN}⚠️  Content Warnings: {Colors.BOLD}{', '.join(flags.keys()) or 'None'}{Colors.ENDC}")
    
    print("="*60 + "\n")


def display_multiple_jokes(jokes: list) -> None:
    """
    Display multiple jokes with numbering.
    
    Args:
        jokes: List of joke dictionaries
    """
    if not jokes:
        print(f"{Colors.RED}❌ No jokes found!{Colors.ENDC}")
        return
    
    print("\n" + "="*60)
    print(f"{Colors.BOLD}{Colors.CYAN}😂 JOKE COLLECTION (x{len(jokes)}) 😂{Colors.ENDC}")
    print("="*60 + "\n")
    
    for i, joke in enumerate(jokes, 1):
        print(f"{Colors.BOLD}{Colors.BLUE}[Joke {i}]{Colors.ENDC}")
        
        if joke.get("type") == "single":
            print(f"{Colors.YELLOW}{joke.get('joke', 'No joke')}{Colors.ENDC}")
        elif joke.get("type") == "twopart":
            print(f"{Colors.YELLOW}Setup:{Colors.ENDC} {joke.get('setup', '')}")
            print(f"{Colors.CYAN}Delivery:{Colors.ENDC} {joke.get('delivery', '')}")
        
        category = joke.get("category", "Unknown")
        print(f"{Colors.GREEN}Category: {category}{Colors.ENDC}\n")
    
    print("="*60 + "\n")


def interactive_menu() -> None:
    """
    Interactive menu for joke generator.
    """
    while True:
        print(f"\n{Colors.BOLD}{Colors.CYAN}🎪 RANDOM JOKE GENERATOR 🎪{Colors.ENDC}")
        print(f"{Colors.BOLD}{Colors.CYAN}{'='*40}{Colors.ENDC}")
        print(f"{Colors.YELLOW}1.{Colors.ENDC} Get a random joke")
        print(f"{Colors.YELLOW}2.{Colors.ENDC} Get a programming joke")
        print(f"{Colors.YELLOW}3.{Colors.ENDC} Get a knock-knock joke")
        print(f"{Colors.YELLOW}4.{Colors.ENDC} Get multiple jokes")
        print(f"{Colors.YELLOW}5.{Colors.ENDC} Available categories")
        print(f"{Colors.YELLOW}6.{Colors.ENDC} Exit")
        print(f"{Colors.BOLD}{Colors.CYAN}{'='*40}{Colors.ENDC}\n")
        
        choice = input(f"{Colors.GREEN}Choose an option (1-6): {Colors.ENDC}").strip()
        
        if choice == "1":
            print(f"\n{Colors.BLUE}🔄 Fetching a random joke...{Colors.ENDC}")
            joke = fetch_joke()
            display_joke(joke)
        
        elif choice == "2":
            print(f"\n{Colors.BLUE}🔄 Fetching a programming joke...{Colors.ENDC}")
            joke = fetch_joke_by_category("Programming")
            display_joke(joke)
        
        elif choice == "3":
            print(f"\n{Colors.BLUE}🔄 Fetching a knock-knock joke...{Colors.ENDC}")
            joke = fetch_joke_by_category("Knock-knock")
            display_joke(joke)
        
        elif choice == "4":
            try:
                count = int(input(f"{Colors.GREEN}How many jokes? (1-10): {Colors.ENDC}"))
                if 1 <= count <= 10:
                    print(f"\n{Colors.BLUE}🔄 Fetching {count} jokes...{Colors.ENDC}")
                    jokes = fetch_multiple_jokes(count)
                    display_multiple_jokes(jokes)
                else:
                    print(f"{Colors.RED}❌ Please enter a number between 1 and 10.{Colors.ENDC}")
            except ValueError:
                print(f"{Colors.RED}❌ Invalid input. Please enter a number.{Colors.ENDC}")
        
        elif choice == "5":
            print(f"\n{Colors.BOLD}{Colors.CYAN}Available Categories:{Colors.ENDC}")
            categories = [
                "Any - Random joke from any category",
                "Programming - Computer/programming jokes",
                "Knock-knock - Knock-knock jokes",
                "General - General humor"
            ]
            for cat in categories:
                print(f"{Colors.YELLOW}• {cat}{Colors.ENDC}")
            print()
        
        elif choice == "6":
            print(f"\n{Colors.GREEN}{Colors.BOLD}👋 Thanks for laughing! Goodbye! 👋{Colors.ENDC}\n")
            break
        
        else:
            print(f"{Colors.RED}❌ Invalid choice. Please select 1-6.{Colors.ENDC}")


def main() -> None:
    """
    Main function - runs the joke generator.
    """
    print(f"\n{Colors.BOLD}{Colors.CYAN}")
    print("╔" + "="*58 + "╗")
    print("║" + " "*58 + "║")
    print("║" + "  🎪 WELCOME TO RANDOM JOKE GENERATOR 🎪".center(58) + "║")
    print("║" + "  Using JokeAPI - https://jokeapi.dev".center(58) + "║")
    print("║" + " "*58 + "║")
    print("╚" + "="*58 + "╝")
    print(f"{Colors.ENDC}\n")
    
    interactive_menu()


if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        print(f"\n\n{Colors.YELLOW}⌨️  Program interrupted by user.{Colors.ENDC}\n")
    except Exception as e:
        print(f"\n{Colors.RED}❌ Unexpected error: {str(e)}{Colors.ENDC}\n")
