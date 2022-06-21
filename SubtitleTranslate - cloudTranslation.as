/*
	Real time subtitle translate for PotPlayer using Yandex API
*/

// void OnInitialize()
// void OnFinalize()
// string GetTitle() 														-> get title for UI
// string GetVersion														-> get version for manage
// string GetDesc()															-> get detail information
// string GetLoginTitle()													-> get title for login dialog
// string GetLoginDesc()													-> get desc for login dialog
// string GetUserText()														-> get user text for login dialog
// string GetPasswordText()													-> get password text for login dialog
// string ServerLogin(string User, string Pass)								-> login
// string ServerLogout()													-> logout
//------------------------------------------------------------------------------------------------
// array<string> GetSrcLangs() 												-> get source language
// array<string> GetDstLangs() 												-> get target language
// string Translate(string Text, string &in SrcLang, string &in DstLang) 	-> do translate !!

// https://nmt.xmu.edu.cn/static/api_zh-cn.html#_8
array<string> DstLangTable = 
{
	"zh-cn", // 简体中文
	"zh-tw", // 繁体中文
	"en", // 英文
	"de", // 德文
	"fr", // 法文
	"es", // 西班牙文
	"pt", // 葡萄牙文
	"it", // 意大利文
	"ru", // 俄文
	"ja", // 日文
	"id", // 印尼文
	"ms", // 马来文
	// "vi", // 越南文
	"bo", // 藏文
	"ug" // 维吾尔文
	// "mn" // 蒙古文
};

array<string> SrcLangTable = 
{
	"zh-cn", // 简体中文
	"zh-tw", // 繁体中文
	"en", // 英文
	"de", // 德文
	"fr", // 法文
	"es", // 西班牙文
	"pt", // 葡萄牙文
	"it", // 意大利文
	"ru", // 俄文
	"ja", // 日文
	"id", // 印尼文
	"ms", // 马来文
	"vi", // 越南文
	"bo", // 藏文
	"ug", // 维吾尔文
	"mn" // 蒙古文
};

string UserAgent = "Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36";

string GetTitle()
{
	return "{$CP936=云译在线多语言机器翻译$}{$CP0=Cloud Translation$}";
}

string GetVersion()
{
	return "1.0 (2019-02-24)";
}

string GetDesc()
{
	return "https://nmt.xmu.edu.cn/";
}

string GetLoginTitle()
{
	return "Set prefix of Cloud Translation";
}

string GetLoginDesc()
{
	return "Set prefix of Cloud Translation";
}

string GetUserText()
{
	return "Prefix:";
}

string GetPasswordText()
{
	return "";
}

string prefix;

string ServerLogin(string User, string Pass)
{
	prefix = User;
	// if (api_key.empty()) return "fail";
	return "200 ok";
}

void ServerLogout()
{
	prefix = "";
}

array<string> GetSrcLangs()
{
	array<string> ret = SrcLangTable;
	
	// ret.insertAt(0, ""); // empty is auto
	return ret;
}

array<string> GetDstLangs()
{
	array<string> ret = DstLangTable;
	
	return ret;
}

string Translate(string Text, string &in SrcLang, string &in DstLang)
{
	// HostOpenConsole();	// for debug
	
	string enc = HostUrlEncode(Text);
	string url = "https://nmt.xmu.edu.cn/nmt?lang=" + SrcLang + "_" + DstLang + "&src=" + enc;
	string ret = HostUrlGetString(url, UserAgent);
	if (ret.length() > 0)
	{
		SrcLang = "UTF8";
		DstLang = "UTF8";
		return "" + prefix + ret;
	}
	
	return "";
}
