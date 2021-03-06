/*package com.you.beat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.you.streaming.StreamingService;


@Controller
///template 맵핑 현재 지운상태
@RequestMapping(value="/header")
public class YoubeatController {

	@Autowired
	private StreamingService streamingService;

	@RequestMapping(value = "/youbeat", method={RequestMethod.POST , RequestMethod.GET})
	public String youbeat(){
		return "template/youbeat";
	}

	@RequestMapping(value="music")
	private void music(){}

	//tracks  파트부분
	@RequestMapping(value= "/tracks")
	public void tracks(){}

	@RequestMapping(value= "/tracks", method=RequestMethod.POST)
	public String tracks(Model model){
		return "";
	}

	// Artist 파트 부분 - 경로 이동
	@RequestMapping(value="/artist", method=RequestMethod.GET)
	public String artist() {
		return "artist/artistList";
	}

	// AJAX요청 - 추천 아티스트 페이지 불러오기
	@RequestMapping(value="/featuredPage", method=RequestMethod.GET)
	public String featuredPage(@RequestParam(defaultValue="1") int curPage,
			@RequestParam(defaultValue="6") int perPage, Model model) {
		return this.streamingService.artistfeaturedPage(curPage, perPage, model);
	}

	// AJAX요청 - 아티스트 페이지의 하단리스트 처리를 위함
	@RequestMapping(value="/newCharts", method=RequestMethod.GET)
	public String newCharts(@RequestParam(defaultValue="1") int curPage,
			@RequestParam(defaultValue="6") int perPage, Model model) {
		return this.streamingService.artistNewCharts(curPage, perPage, model);
	}

	// AJAX요청 - 모든 아티스트 페이지 불러오기
	@RequestMapping(value="/allArtistPage", method=RequestMethod.GET)
	public String allArtistPage() {
		return "artist/allArtistPage";
	}
	// ArtistView - 아티스트 정보, 음악 정보(판매량이 많은 순서대로) 가져오기
	@RequestMapping(value="/artistView", method=RequestMethod.GET)
	public String artistView(@RequestParam String arartist, Model model) {
		return this.streamingService.artistView(arartist, model);
	}

	// LATEST ALBUMS - AJAX 요청 (앨범, 앨범 이미지 가져오기) 리스트로 perPage는 4
	@RequestMapping(value="/artistLatestAlbums", method=RequestMethod.GET)
	public String artistLatestAlbums(@RequestParam String arartist, 
			@RequestParam(defaultValue="1") int curPage, 
			@RequestParam(defaultValue="4") int perPage, Model model) {
		return this.streamingService.artistLatestAlbums(arartist, curPage, perPage, model);
	}

	// MUSIC CHARTS - AJAX 요청 (음악, 아티스트 이미지, 앨범 이미지 가져오기)
	@RequestMapping(value="/artistMusicCharts", method=RequestMethod.GET)
	public String artistMusicCharts(@RequestParam String arartist, Model model,
			@RequestParam(defaultValue="1") int curPage) {
		return this.streamingService.artistMusicCharts(arartist, curPage, model);
	}
}
*/