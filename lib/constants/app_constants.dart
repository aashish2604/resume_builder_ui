RegExp ANCHOR_TAG_REGEX = RegExp(r'https?:\/\/[^\s\[\]]+\[([^\[\]]+)\]');
RegExp PHONE_NUMBER_REGEX =
    RegExp(r'^[+]\d{1,3}\s?\d{3}\s?\d{3}\s?\d{2}\s?\d{2}$');
RegExp LINKEDIN_PROFILE_REGEX = RegExp(
    r'^(http(s)?:\/\/)?([\w]+\.)?linkedin\.com\/(pub|in|profile)\/([-a-zA-Z0-9]+)\/?$');
RegExp EMAIL_REGEX = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
RegExp URL_REGEX = RegExp(r'^(https?|http):\/\/[^\s/$.?#].[^\s]*$');

const BASIC_TEMPLATE_PATH = "local_assets/BasicTemplate_img.JPG";
const IMAGE_TEMPLATE_PATH = "local_assets/ImageTemplate_img.JPG";
const LINKED_TEMPLATE_PATH = "local_assets/LinkTemplate_img.JPG";
