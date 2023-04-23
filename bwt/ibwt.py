def ibwt(r: str) -> str:
    """Apply inverse Burrows–Wheeler transform."""
    table = [""] * len(r)  # Make empty table
    for _ in range(len(r)):
        table = sorted(r[i] + table[i] for i in range(len(r)))  # Add a column of r

    s = next((row for row in table if row.endswith("\003")), "") # Iterate over and check whether last charecter ends with ETX or not
    return s.rstrip("\003").strip("\002")  # Retrive data from array and get rid of start and end markers
