from src import mood_nft

import base64


def deploy_mood_nft():
    # happy_svg_uri = ""
    # sad_svg_uri = ""
    with open("images/happy.svg", "r") as f:
        happy_svg = f.read()
        happy_svg_uri = svg_to_base64_uri(happy_svg)
        print(f"Happy SVG URI: {happy_svg_uri}")
    with open("images/sad.svg", "r") as f:
        sad_svg = f.read()
        sad_svg_uri = svg_to_base64_uri(sad_svg)
        print(f"Sad SVG URI: {sad_svg_uri}")
    contract = mood_nft.deploy(happy_svg_uri, sad_svg_uri)
    return contract


def svg_to_base64_uri(svg):
    svg_bytes = svg.encode("utf-8")
    base64_bytes = base64.b64encode(svg_bytes)
    base64_string = base64_bytes.decode("utf-8")
    return f"data:image/svg+xml;base64,{base64_string}"


def moccasin_main():
    deploy_mood_nft()
